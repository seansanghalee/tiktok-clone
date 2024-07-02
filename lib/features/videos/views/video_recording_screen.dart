import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/videos/views/video_preview_screen.dart';

class VideoRecordingScreen extends StatefulWidget {
  static const routeName = "postVideo";
  static const routeUrl = "/upload";

  const VideoRecordingScreen({super.key});

  @override
  State<VideoRecordingScreen> createState() => _VideoRecordingScreenState();
}

class _VideoRecordingScreenState extends State<VideoRecordingScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  bool _hasPermission = false;
  bool _isSelfieMode = false;

  late final AnimationController _buttonAnimationController =
      AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
  );

  late final Animation<double> _buttonAnimation =
      Tween(begin: 1.0, end: 1.3).animate(_buttonAnimationController);

  late final AnimationController _progressAnimationController =
      AnimationController(
    vsync: this,
    duration: const Duration(seconds: 10),
    lowerBound: 0.0,
    upperBound: 1.0,
  );

  late FlashMode _flashMode;

  late CameraController _cameraController;

  // late final bool _noCamera = kDebugMode && Platform.isIOS;
  final _noCamera = false;

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      return;
    }

    _cameraController = CameraController(
        cameras[_isSelfieMode ? 1 : 0], ResolutionPreset.ultraHigh);

    await _cameraController.initialize();
    await _cameraController.prepareForVideoRecording();

    _flashMode = _cameraController.value.flashMode;
  }

  Future<void> initPermissions() async {
    final cameraPermission = await Permission.camera.request();
    final micPermission = await Permission.microphone.request();

    final cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;
    final micDenied =
        micPermission.isDenied || micPermission.isPermanentlyDenied;

    if (!cameraDenied && !micDenied) {
      _hasPermission = true;
      await initCamera();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    if (!_noCamera) {
      initPermissions();
      WidgetsBinding.instance.addObserver(this);
      _progressAnimationController.addListener(() {
        setState(() {});
      });
      _progressAnimationController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _stopRecording();
        }
      });
    } else {
      setState(() {
        _hasPermission = true;
      });
    }
  }

  void _toggleSelfieMode() async {
    _isSelfieMode = !_isSelfieMode;
    await initCamera();
    setState(() {});
  }

  Future<void> setFlashMode(FlashMode newFlashMode) async {
    await _cameraController.setFlashMode(newFlashMode);
    _flashMode = newFlashMode;
    setState(() {});
  }

  Future<void> _startRecording(TapDownDetails _) async {
    if (_cameraController.value.isRecordingVideo) {
      return;
    }

    await _cameraController.startVideoRecording();

    _buttonAnimationController.forward();
    _progressAnimationController.forward();
  }

  Future<void> _stopRecording() async {
    if (!_cameraController.value.isRecordingVideo) {
      return;
    }

    _buttonAnimationController.reverse();
    _progressAnimationController.reset();

    final video = await _cameraController.stopVideoRecording();

    if (!mounted) {
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoPreviewScreen(
          video: video,
          isPicked: false,
        ),
      ),
    );
  }

  Future<void> _onPickVideoPressed() async {
    final video = await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (video == null) {
      return;
    }

    if (!mounted) {
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoPreviewScreen(
          video: video,
          isPicked: true,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _buttonAnimationController.dispose();
    _progressAnimationController.dispose();
    _cameraController.dispose();
    super.dispose();
  }

  Future<void> didChangeAppLifeCycleState(AppLifecycleState state) async {
    if (!_hasPermission) {
      return;
    }

    if (!_cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      _cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      await initCamera();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: !_hasPermission || !_cameraController.value.isInitialized
              ? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Initializing camera..."),
                    Gaps.v20,
                    CircularProgressIndicator.adaptive()
                  ],
                )
              : Stack(
                  alignment: Alignment.center,
                  children: [
                    CameraPreview(_cameraController),
                    Positioned(
                        top: 40,
                        right: 20,
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: _toggleSelfieMode,
                              icon: const Icon(Icons.cameraswitch),
                              color: Colors.white,
                            ),
                            Gaps.v10,
                            IconButton(
                              onPressed: () => setFlashMode(FlashMode.off),
                              icon: const Icon(Icons.flash_off_rounded),
                              color: _flashMode == FlashMode.off
                                  ? Colors.yellow
                                  : Colors.white,
                            ),
                            IconButton(
                              onPressed: () => setFlashMode(FlashMode.always),
                              icon: const Icon(Icons.flash_on_rounded),
                              color: _flashMode == FlashMode.always
                                  ? Colors.yellow
                                  : Colors.white,
                            ),
                            IconButton(
                              onPressed: () => setFlashMode(FlashMode.auto),
                              icon: const Icon(Icons.flash_auto_rounded),
                              color: _flashMode == FlashMode.auto
                                  ? Colors.yellow
                                  : Colors.white,
                            ),
                            IconButton(
                              onPressed: () => setFlashMode(FlashMode.torch),
                              icon: const Icon(Icons.flashlight_on_rounded),
                              color: _flashMode == FlashMode.torch
                                  ? Colors.yellow
                                  : Colors.white,
                            ),
                          ],
                        )),
                    Positioned(
                      width: MediaQuery.of(context).size.width,
                      bottom: Sizes.size72,
                      child: Row(
                        children: [
                          const Spacer(),
                          GestureDetector(
                            onTapDown: (details) => _startRecording(details),
                            onTapUp: (details) => _stopRecording(),
                            child: ScaleTransition(
                              scale: _buttonAnimation,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    width: Sizes.size60,
                                    height: Sizes.size60,
                                    child: CircularProgressIndicator(
                                      color: Colors.red,
                                      value: _progressAnimationController.value,
                                    ),
                                  ),
                                  Container(
                                    width: Sizes.size52,
                                    height: Sizes.size52,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: IconButton(
                                onPressed: _onPickVideoPressed,
                                icon: const FaIcon(
                                  FontAwesomeIcons.image,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

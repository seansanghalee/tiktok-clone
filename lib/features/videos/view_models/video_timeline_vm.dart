import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/videos/models/video_model.dart';

class VideoTimelineViewModel extends AsyncNotifier<List<VideoModel>> {
  final List<VideoModel> _list = [
    VideoModel(title: "first"),
  ];

  @override
  FutureOr<List<VideoModel>> build() async {
    await Future.delayed(const Duration(seconds: 5));
    return _list;
  }
}

final videoTimelineProvider =
    AsyncNotifierProvider<VideoTimelineViewModel, List<VideoModel>>(
  () => VideoTimelineViewModel(),
);

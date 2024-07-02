import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/videos/repos/videos_repo.dart';

class UploadVideoViewModel extends AsyncNotifier<void> {
  late final VideosRepository _repository;

  @override
  FutureOr build() {
    _repository = ref.read(videosRepo);
  }

  Future<void> uploadVideo(File video) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.uploadVideoFile(video);
    });
  }
}

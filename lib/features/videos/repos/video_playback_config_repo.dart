import 'package:shared_preferences/shared_preferences.dart';

class VideoPlaybackConfigRepository {
  static const _autoplay = "autoplay";
  static const _muted = "muted";

  SharedPreferences preferences;

  VideoPlaybackConfigRepository({
    required this.preferences,
  });

  Future<void> setMuted(bool value) async {
    preferences.setBool(_muted, value);
  }

  Future<void> setAutoPlay(bool value) async {
    preferences.setBool(_autoplay, value);
  }

  bool isMuted() {
    return preferences.getBool(_muted) ?? false;
  }

  bool isAutoplay() {
    return preferences.getBool(_autoplay) ?? false;
  }
}

import 'package:just_audio/just_audio.dart';

class SharedAudioPlayer {
  static final SharedAudioPlayer _instance = SharedAudioPlayer._internal();
  late AudioPlayer _player;
  String? _currentId;

  factory SharedAudioPlayer() {
    return _instance;
  }

  SharedAudioPlayer._internal() {
    _player = AudioPlayer();
  }

  AudioPlayer get player => _player;

  String? get currentId => _currentId;

  Future<void> setAudioSource(ConcatenatingAudioSource audioSource) async {
    try {
      await _player.stop();
      await _player.setAudioSource(audioSource);
    } catch (e) {
      print("Error setting audio source: $e");
    }
  }

  Future<void> play(String id, Uri uri) async {
    if (_currentId != id) {
      await _player.stop();
      await _player.setUrl(uri.toString());
      _currentId = id;
    }

    await _player.play();
  }

  Future<void> playPlaylist(String id, ConcatenatingAudioSource playlist) async {
    if (_currentId != id) {
      await _player.stop();
      await _player.setAudioSource(playlist);
      _currentId = id;
    }

    await _player.play();
  }

  Future<void> pause() async {
    await _player.pause();
  }

  Future<void> stop() async {
    await _player.stop();
    _currentId = null;
  }

  bool get isPlaying => _player.playing;
}

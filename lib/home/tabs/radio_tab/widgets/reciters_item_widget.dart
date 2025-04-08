import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:islami_app/home/tabs/radio_tab/repo/reciters_reposetory.dart';
import 'package:islami_app/my_theme/my_theme.dart';

class RecitersItemWidget extends StatefulWidget {
  final Reciters reciter;

  const RecitersItemWidget({required this.reciter});

  @override
  State<RecitersItemWidget> createState() => _RecitersItemWidget();
}

class _RecitersItemWidget extends State<RecitersItemWidget> {
  late AudioPlayer _player;
  bool _isPlaying = false;
  double _volume = 1.0;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();

    _initPlaylist();
  }

  Future<void> _initPlaylist() async {
    try {
      if (widget.reciter.moshaf != null && widget.reciter.moshaf!.isNotEmpty) {
        final moshaf = widget.reciter.moshaf!.first;
        final serverUrl = moshaf.server;
        final surahList = List.generate(114, (i) => '${(i + 1).toString().padLeft(3, '0')}.mp3');

        final playlist = ConcatenatingAudioSource(
          children: surahList.map((surah) {
            return AudioSource.uri(Uri.parse('$serverUrl/$surah'));
          }).toList(),
        );

        await _player.setAudioSource(playlist);
      }
    } catch (e) {
      print("Error loading playlist: $e");
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void _togglePlayPause() async {
    if (_player.playerState.playing) {
      await _player.pause();
      setState(() {
        _isPlaying = false;
      });
    } else {
      await _player.play();
      setState(() {
        _isPlaying = true;
      });
    }
  }

  void _stopAudio() async {
    await _player.stop();
    setState(() {
      _isPlaying = false;
    });
  }

  void _adjustVolume() {
    _volume = _volume == 1.0 ? 0.0 : 1.0;
    _player.setVolume(_volume);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 150,
          padding: EdgeInsets.symmetric(vertical: 28, horizontal: 16),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: MYTheme.primaryColor,
          ),
          child: Image.asset("assets/images/Mosque-02.png"),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                widget.reciter.name ?? 'No Name',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: MYTheme.secondryColor),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _stopAudio,
                  icon: Icon(Icons.stop, color: MYTheme.secondryColor),
                ),
                SizedBox(width: 16),
                IconButton(
                  onPressed: _togglePlayPause,
                  icon: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    color: MYTheme.secondryColor,
                  ),
                ),
                SizedBox(width: 16),
                IconButton(
                  onPressed: _adjustVolume,
                  icon: Icon(
                    _volume > 0.5 ? Icons.volume_up : Icons.volume_off,
                    color: MYTheme.secondryColor,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

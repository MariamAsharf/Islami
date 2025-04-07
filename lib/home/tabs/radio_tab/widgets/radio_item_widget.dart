import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/radio_tab/repo/radio_reposetory.dart';
import 'package:islami_app/home/tabs/radio_tab/repo/reciters_reposetory.dart';
import 'package:islami_app/my_theme/my_theme.dart';

class RadioItemWidget extends StatefulWidget {
  final dynamic radio;

  const RadioItemWidget({required this.radio});

  @override
  _RadioItemWidgetState createState() => _RadioItemWidgetState();
}

class _RadioItemWidgetState extends State<RadioItemWidget> {
  String? _audioUrl;


  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  double _volume = 1.0;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    if (widget.radio is Radios) {
      _audioUrl = widget.radio.url;
    } else if (widget.radio is Reciters) {
      final reciter = widget.radio as Reciters;
      if (reciter.moshaf != null && reciter.moshaf!.isNotEmpty) {
        final moshaf = reciter.moshaf!.first;
        _audioUrl = moshaf.server;
      }
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _togglePlayPause() async {
    if (_audioUrl == null) return;

    if (_isPlaying) {
      await _audioPlayer.pause();
      setState(() {
        _isPlaying = false;
      });
    } else {
      // لازم نعمل setSource كل مرة علشان يبدأ من الأول
      await _audioPlayer.setSource(UrlSource(_audioUrl!));
      await _audioPlayer.resume();
      setState(() {
        _isPlaying = true;
      });
    }
  }

  void _stopAudio() async {
    await _audioPlayer.stop();
    setState(() {
      _isPlaying = false;
    });
  }

  void _adjustVolume() async {
    _volume = _volume == 1.0 ? 0.0 : 1.0;
    await _audioPlayer.setVolume(_volume);
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
          child: Image(
            image: AssetImage("assets/images/Mosque-02.png"),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                widget.radio.name ?? 'No Name',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: MYTheme.secondryColor),
              ),
            ),
            SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _stopAudio,
                  icon: Icon(
                    Icons.stop,
                    color: MYTheme.secondryColor,
                  ),
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

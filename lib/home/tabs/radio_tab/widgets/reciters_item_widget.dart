// import 'package:flutter/material.dart';
// import 'package:islami_app/home/tabs/radio_tab/radio_cubit.dart';
// import 'package:islami_app/home/tabs/radio_tab/repo/reciters_reposetory.dart';
// import 'package:islami_app/home/tabs/radio_tab/shared_audio_player.dart';
// import 'package:islami_app/my_theme/my_theme.dart';
// import 'package:just_audio/just_audio.dart';
//
// class RecitersItemWidget extends StatefulWidget {
//   final Reciters reciter;
//
//   const RecitersItemWidget({required this.reciter});
//
//   @override
//   State<RecitersItemWidget> createState() => _RecitersItemWidget();
// }
//
// class _RecitersItemWidget extends State<RecitersItemWidget> {
//   late final SharedAudioPlayer _sharedPlayer;
//   bool _isPlaying = false;
//   double _volume = 1.0;
//
//   @override
//   void initState() {
//     super.initState();
//     _sharedPlayer = SharedAudioPlayer();
//   }
//
//   @override
//   void dispose() {
//     _sharedPlayer.stop();
//     super.dispose();
//   }
//
//   void _togglePlayPause() async {
//     print('Current tab index: ${RadioCubit.get(context).currentTabIndex}');
//     // if (RadioCubit.get(context).currentTabIndex != 1)
//     //   return;
//
//     if (_isPlaying) {
//       await _sharedPlayer.pause();
//     } else {
//       try {
//         final moshaf = widget.reciter.moshaf?.first;
//         final serverUrl = moshaf?.server ?? '';
//         final sheikhId = widget.reciter.id.toString();
//
//         final surahList = List.generate(114, (index) {
//           final surahNumber = (index + 1).toString().padLeft(3, '0');
//           final surahUrl = '$serverUrl${surahNumber}.mp3';
//           debugPrint('Playing: $surahUrl');
//           return AudioSource.uri(Uri.parse(surahUrl));
//         });
//
//         final playlist = ConcatenatingAudioSource(children: surahList);
//         print('Now playing: $serverUrl${001}.mp3');
//
//         await _sharedPlayer.playPlaylist(sheikhId, playlist);
//       } catch (e) {
//         print("Error playing reciter: $e");
//       }
//     }
//
//     setState(() {
//       _isPlaying = !_isPlaying;
//     });
//   }
//
//   void _stopAudio() async {
//     await _sharedPlayer.stop();
//     setState(() {
//       _isPlaying = false;
//     });
//   }
//
//   void _toggleVolume() async {
//     _volume = _volume == 1.0 ? 0.0 : 1.0;
//     await _sharedPlayer.player.setVolume(_volume);
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.topCenter,
//       children: [
//         Container(
//           height: 150,
//           padding: EdgeInsets.symmetric(vertical: 28, horizontal: 16),
//           alignment: Alignment.bottomCenter,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: MYTheme.primaryColor,
//           ),
//           child: Image.asset("assets/images/Mosque-02.png"),
//         ),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             SizedBox(height: 8),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               child: Text(
//                 widget.reciter.name ?? 'No Name',
//                 textAlign: TextAlign.center,
//                 style: Theme.of(context)
//                     .textTheme
//                     .titleMedium
//                     ?.copyWith(color: MYTheme.secondryColor),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   onPressed: _stopAudio,
//                   icon: Icon(Icons.stop, color: MYTheme.secondryColor),
//                 ),
//                 SizedBox(width: 16),
//                 IconButton(
//                   onPressed: _togglePlayPause,
//
//                   icon: Icon(
//                     _isPlaying ? Icons.pause : Icons.play_arrow,
//                     color: MYTheme.secondryColor,
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 IconButton(
//                   onPressed: _toggleVolume,
//                   icon: Icon(
//                     _volume > 0.5 ? Icons.volume_up : Icons.volume_off,
//                     color: MYTheme.secondryColor,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }

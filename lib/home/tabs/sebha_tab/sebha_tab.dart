import 'package:flutter/material.dart';
import 'package:islami_app/my_theme/my_theme.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double turns = 0;
  int index = 0;
  List<String> tasbeeh = [
    "سبحان الله",
    "الحمد لله",
    "لا اله الا الله",
    "الله اكبر",
    "استغفر الله العظيم"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Image(
            image: AssetImage("assets/images/onboarding_header.png"),
            width: 291,
            height: 170,
          ),
          SizedBox(height: 16),
          Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: MYTheme.thirdColor, fontSize: 32),
          ),
          SizedBox(height: 16),
          Container(
            child: Image(
              image: AssetImage("assets/images/Mask group.png"),
              width: 73,
              height: 86,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                turns += 1 / 30;
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedRotation(
                  turns: turns,
                  duration: Duration(seconds: 1),
                  child: Image(
                    image: AssetImage("assets/images/SebhaBody 1.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(height: 42),
                      Text(
                        tasbeeh[index],
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: MYTheme.thirdColor, fontSize: 30),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "${index + 1}",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: MYTheme.thirdColor, fontSize: 30),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

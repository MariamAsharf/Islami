import 'package:flutter/material.dart';
import 'package:islami_app/my_theme/my_theme.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab>
    with SingleTickerProviderStateMixin {
  int count = 1;
  int index = 0;
  late AnimationController _controller;
  List<String> tasbeeh = [
    "سبحان الله",
    "الحمد لله",
    "لا اله الا الله",
    "الله اكبر",
    "استغفر الله العظيم",
    "الصلاة علي النبي",
  ];

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void incrementSebha() {
    setState(() {
      count++;
      if (count > 30) {
        count =1;
        index = (index + 1) % tasbeeh.length;
      }
    });
    _controller.forward(from: 0);
  }

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
            onTap: incrementSebha,
            child: Stack(
              alignment: Alignment.center,
              children: [
                RotationTransition(
                  turns: Tween(begin: 0.0, end: 1 / 30).animate(_controller),
                  child: Image(
                    image: AssetImage("assets/images/SebhaBody 1.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(height: 42),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          tasbeeh[index],
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: MYTheme.thirdColor, fontSize: 30),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        count.toString(),
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

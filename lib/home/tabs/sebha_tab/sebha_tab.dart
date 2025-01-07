import 'package:flutter/material.dart';
import 'package:islami_app/my_theme/my_theme.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

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
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image(
                  image: AssetImage("assets/images/Sebha_round.png"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GestureDetector(
                    onTap: (){

                    },
                    child: Column(
                      children: [
                        SizedBox(height: 42),
                        Text(
                          "سبحان الله ",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: MYTheme.thirdColor, fontSize: 30),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "30",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: MYTheme.thirdColor, fontSize: 30),
                        ),
                      ],
                    ),
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

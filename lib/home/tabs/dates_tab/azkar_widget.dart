import 'package:flutter/material.dart';
import 'package:islami_app/my_theme/my_theme.dart';

class AzkarWidget extends StatelessWidget {
  AzkarWidget({super.key});

  List<Map<String, String>> Azkars = [
    {"name": "Evening Azkar", "image": "assets/images/Illustration.png"},
    {"name": "Morning Azkar", "image": "assets/images/Illustration-1.png"},
    {"name": "Pray Azkar", "image": "assets/images/Illustration-2.png"},
    {"name": "Tasabeeh Azkar", "image": "assets/images/Illustration-3.png"},
    {"name": "Sleep Azkar", "image": "assets/images/Illustration-4.png"},
    {"name": "WakeUp Azkar", "image": "assets/images/Illustration-5.png"},
    {"name": "Quran Doaa", "image": "assets/images/Illustration-6.png"},
    {"name": "Rasols Doaa", "image": "assets/images/Illustration-7.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.8,
          ),
          itemCount: Azkars.length,
          itemBuilder: (context, index) {
            final azkar = Azkars[index];
            return GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    color: MYTheme.secondryColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: MYTheme.primaryColor)),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage(azkar["image"]!),
                    ),
                    Text(
                      azkar["name"]!,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: MYTheme.thirdColor),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/my_theme/my_theme.dart';

class DatesTab extends StatelessWidget {
  DatesTab({super.key});

  List<Map<String, String>> Times = [
    {
      "name": "Fajr",
      "time": "03:30",
      "date": "AM",
    },
    {
      "name": "Dhuhr",
      "time": "01:01",
      "date": "PM",
    },
    {
      "name": "Asr",
      "time": "04:38",
      "date": "PM",
    },
    {
      "name": "Maghreb",
      "time": "07:57",
      "date": "PM",
    },
    {
      "name": "Isha",
      "time": "09:57",
      "date": "PM",
    }
  ];
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color(0xFF856B3F),
                ),
                child: Image(
                  image: AssetImage("assets/images/Group 9.png"),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          textAlign: TextAlign.start,
                          "16 Jul,\n2024",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: MYTheme.thirdColor),
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text(
                              "Pray Time",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: MYTheme.secondryColor),
                            ),
                            Text(
                              "Tuesday",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: MYTheme.secondryColor),
                            ),
                          ],
                        ),
                        Spacer(),
                        Text(
                          textAlign: TextAlign.end,
                          "09 Muh,\n1446",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: MYTheme.thirdColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 120,
                    child: CarouselSlider(
                      options: CarouselOptions(
                          height: double.infinity,
                          enlargeCenterPage: true,
                          viewportFraction: 0.4,
                          scrollDirection: Axis.horizontal),
                      items: Times.map((time) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 2),
                              height: 120,
                              width: 104,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0x99534731),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 9, vertical: 12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      time["name"]!,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                              color: MYTheme.thirdColor,
                                              fontSize: 14),
                                    ),
                                    Text(
                                      time["time"]!,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                              color: MYTheme.thirdColor,
                                              fontSize: 32),
                                    ),
                                    Text(
                                      time["date"]!,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(color: MYTheme.thirdColor),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Spacer(),
                        Text(
                          "Next Pray - 02:32",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: MYTheme.secondryColor),
                        ),
                        SizedBox(width: 50),
                        Icon(
                          Icons.volume_off_rounded,
                          size: 25,
                          color: MYTheme.secondryColor,
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 20),
          Text(
            "Azkar",
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: MYTheme.thirdColor),
          ),
          SizedBox(height: 20),
          Expanded(
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
                                .titleMedium
                                ?.copyWith(color: MYTheme.thirdColor),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

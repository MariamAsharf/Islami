import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/home/tabs/dates_tab/timing_cubit.dart';
import 'package:islami_app/home/tabs/dates_tab/timing_state.dart';
import 'package:islami_app/my_theme/my_theme.dart';

import 'azkar/azkar_widget.dart';

class DatesTab extends StatelessWidget {
  DatesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimingsCubit()..fetchTimings(context),
      child: Padding(
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
            BlocBuilder<TimingsCubit, TimingsState>(
              builder: (context, state) {
                final cubit = BlocProvider.of<TimingsCubit>(context);
                if (state is TimingsLoading) {
                  return Stack(
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
                      Center(child: CircularProgressIndicator()),
                    ],
                  );
                } else if (state is TimingsError) {
                  return Stack(
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
                      Center(child: Text(state.message)),
                    ],
                  );
                } else if (state is TimingsSuccess) {
                  final timings = state.timings;
                  final gregorianDate = state.gregorianDate;
                  final hijriDate = state.hijriDate;
                  final weekday = state.weekday;

                  final times = [
                    {"name": "Fajr", "time": timings['Fajr'] ?? "00:00"},
                    {"name": "Sunrise", "time": timings['Sunrise'] ?? "00:00"},
                    {"name": "Dhuhr", "time": timings['Dhuhr'] ?? "00:00"},
                    {"name": "Asr", "time": timings['Asr'] ?? "00:00"},
                    {"name": "Sunset", "time": timings['Sunset'] ?? "00:00"},
                    {"name": "Maghrib", "time": timings['Maghrib'] ?? "00:00"},
                    {"name": "Isha", "time": timings['Isha'] ?? "00:00"},
                    {"name": "Imsak", "time": timings['Imsak'] ?? "00:00"},
                    {
                      "name": "Midnight",
                      "time": timings['Midnight'] ?? "00:00"
                    },
                    {
                      "name": "Firstthird",
                      "time": timings['Firstthird'] ?? "00:00"
                    },
                    {
                      "name": "Lastthird",
                      "time": timings['Lastthird'] ?? "00:00"
                    },
                  ];

                  return Stack(
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
                                  gregorianDate,
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                          color: MYTheme.thirdColor,
                                          fontSize: 12),
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    Text(
                                      "Pray Time",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              color: MYTheme.secondryColor),
                                    ),
                                    Text(
                                      weekday,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              color: MYTheme.secondryColor),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  textAlign: TextAlign.end,
                                  hijriDate,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                          color: MYTheme.thirdColor,
                                          fontSize: 12),
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
                                viewportFraction: 0.35,
                                scrollDirection: Axis.horizontal,
                              ),
                              items: times.map((time) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Image(
                                            image: AssetImage(
                                                "assets/images/Rectangle.png")),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              time["name"]!,
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall
                                                  ?.copyWith(
                                                      color:
                                                          MYTheme.thirdColor),
                                            ),
                                            Text(
                                              time["time"]!,
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge
                                                  ?.copyWith(
                                                      color: MYTheme.thirdColor,
                                                      fontSize: 28),
                                            ),
                                          ],
                                        ),
                                      ],
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
                                  "Next Pray - ${state.nextPrayerTime}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(color: MYTheme.secondryColor),
                                ),
                                SizedBox(width: 50),
                                IconButton(
                                  icon: Icon(
                                    cubit.isAdhanSoundOn
                                        ? Icons.volume_up_rounded
                                        : Icons.volume_off_rounded,
                                    size: 25,
                                    color: MYTheme.secondryColor,
                                  ),
                                  onPressed: () {
                                    cubit.toggleAdhanSound();
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }

                return Container();
              },
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
            AzkarWidget(),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

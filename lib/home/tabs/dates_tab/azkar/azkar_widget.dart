import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/dates_tab/repo/zekr_item_model.dart';
import 'package:islami_app/my_theme/my_theme.dart';

import 'azkar_details.dart';
import 'azkar_service.dart';

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
              onTap: () async {
                final zekrModel = await AzkarService.loadAzkarJson();
                List<ZekrItemModel> selectedList = [];

                switch (index) {
                  case 0:
                    selectedList = zekrModel.evening ?? [];
                    break;
                  case 1:
                    selectedList = zekrModel.morning ?? [];
                    break;
                  case 2:
                    selectedList = zekrModel.afterPrayer ?? [];
                    break;
                  case 3:
                    selectedList = zekrModel.tasbeeh ?? [];
                    break;
                  case 4:
                    selectedList = zekrModel.sleep ?? [];
                    break;
                  case 5:
                    selectedList = zekrModel.wakeUp ?? [];
                    break;
                  case 6:
                    selectedList = zekrModel.quranic ?? [];
                    break;
                  case 7:
                    selectedList = zekrModel.prophets ?? [];
                    break;
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AzkarDetails(
                      title: azkar["name"]!,
                      azkarList: selectedList,
                    ),
                  ),
                );
              },
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

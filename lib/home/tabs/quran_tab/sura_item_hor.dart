import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/home/models/sura_model.dart';
import 'package:islami_app/my_theme/my_theme.dart';

class SuraItemHor extends StatelessWidget {
  SuraItemHor({super.key, required this.model});

  SuraModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: MYTheme.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.nameEng,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: MYTheme.secondryColor,
                    ),
              ),
              const SizedBox(height: 12),
              Text(
                model.nameAr,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: MYTheme.secondryColor),
              ),
              const SizedBox(height: 12),
              Text(
                "${model.verse} Verses",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: MYTheme.secondryColor),
              ),
            ],
          ),
          SizedBox(width: 5),
          const Image(
            image: AssetImage("assets/images/sura_item.png"),
          ),
        ],
      ),
    );
  }
}

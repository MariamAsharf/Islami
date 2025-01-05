import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/home/models/sura_model.dart';

class SuraItemVer extends StatelessWidget {
  SuraItemVer({super.key, required this.model});

  SuraModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            const Image(
              image: AssetImage("assets/images/sura_num.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                "${model.index}",
                style: GoogleFonts.elMessiri(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFFFEFFE8),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.nameEng,
              style: GoogleFonts.elMessiri(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFFEFFE8),
              ),
            ),
            Text(
              "${model.verse} Verses",
              style: GoogleFonts.elMessiri(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFFEFFE8),
              ),
            ),
          ],
        ),
        const Spacer(),
        Text(
          model.nameAr,
          style: GoogleFonts.elMessiri(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: const Color(0xFFFEFFE8),
          ),
        ),
      ],
    );
  }
}

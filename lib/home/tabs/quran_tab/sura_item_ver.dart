import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuraItemVer extends StatelessWidget {
  SuraItemVer({
    super.key,
    required this.nameAr,
    required this.index,
    required this.nameEng,
    required this.verse,
  });

  int index;
  String nameAr;
  String nameEng;
  String verse;

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
                "$index",
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
              nameEng,
              style: GoogleFonts.elMessiri(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFFEFFE8),
              ),
            ),
            Text(
              verse,
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
          nameAr,
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

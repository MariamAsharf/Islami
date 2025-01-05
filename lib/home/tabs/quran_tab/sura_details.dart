import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuraDetails extends StatelessWidget {
  const SuraDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "dfghjkl",
          style: GoogleFonts.elMessiri(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFFE2BE7F),
          ),
        ),
      ),
      body: Column(
        children: [
          Text(
            "dfghjkl",
            style: GoogleFonts.elMessiri(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xFFE2BE7F),
            ),
          ),
          SizedBox(height: 42),
          Text(
            "dfghjkl",
            style: GoogleFonts.elMessiri(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFFE2BE7F),
            ),
          ),
        ],
      ),
    );
  }
}

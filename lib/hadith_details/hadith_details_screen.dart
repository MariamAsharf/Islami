import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/home/models/hadith_model.dart';

class HadithDetailsScreen extends StatefulWidget {
  HadithDetailsScreen({super.key});

  @override
  State<HadithDetailsScreen> createState() => _HadithDetailsScreenState();
}

class _HadithDetailsScreenState extends State<HadithDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as HadithModel;
    if (verses.isEmpty) {
      //loadSuraFile(model.index + 1);
    }
    return Scaffold(
      backgroundColor: Color(0xFF202020),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFFE2BE7F),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF202020),
        title: Text(
         // model.nameEng,
          "",
          style: GoogleFonts.elMessiri(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFFE2BE7F),
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image(
            image: AssetImage("assets/images/details_bg.png"),
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              SizedBox(height: 24),
              Text(
               // model.nameAr,
                "",
                style: GoogleFonts.elMessiri(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFE2BE7F),
                ),
              ),
              SizedBox(height: 56),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text.rich(
                              textAlign: TextAlign.center,
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "${verses[index]}",
                                    style: GoogleFonts.elMessiri(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFFE2BE7F),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "(${index + 1})",
                                    style: GoogleFonts.elMessiri(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFFE2BE7F),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: verses.length),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  loadSuraFile(int index) async {
    String file =
        await rootBundle.loadString("assets/ahadith_files/$index.txt");

    setState(() {});
  }
}

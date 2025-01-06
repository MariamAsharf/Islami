import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/home/models/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "SuraDetailsScreen";

  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadSuraFile(model.index + 1);
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
          model.nameEng,
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
                model.nameAr,
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
                  child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.transparent,
                            border: Border.fromBorderSide(
                              BorderSide(
                                color: Color(0xFFE2BE7F),
                              ),
                            ),
                          ),
                          child: Padding(
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
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(height: 8),
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
    String file = await rootBundle.loadString("assets/sura_files/$index.txt");
    List<String> lines = file.split("\n");
    print(lines);
    verses = lines;
    setState(() {});
  }
}

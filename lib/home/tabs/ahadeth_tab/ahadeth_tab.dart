import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/hadith_details/hadith_details_screen.dart';
import 'package:islami_app/home/models/hadith_model.dart';
import 'package:islami_app/my_theme/my_theme.dart';

class AhadethTab extends StatefulWidget {
  AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadithModel> ahadith = [];

  @override
  Widget build(BuildContext context) {
    loadHadethFile();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image(
          image: AssetImage("assets/images/onboarding_header.png"),
          width: 291,
          height: 170,
        ),
        Expanded(
          child: CarouselSlider(
            options: CarouselOptions(height: double.infinity,),
            items: ahadith.map((hadith) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, HadithDetailsScreen.routeName,arguments: hadith);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      child: Stack(
                        children: [
                          Image(
                            image: AssetImage("assets/images/hadeth_bg.png"),
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Column(
                              children: [
                                SizedBox(height: 42),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 22),
                                  child: Text(
                                    hadith.title,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(color: MYTheme.secondryColor),
                                  ),
                                ),
                                SizedBox(height: 12),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 16),
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 14,
                                    hadith.content.first,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(color: MYTheme.secondryColor),
                                  ),
                                ),
                              ],
                            ),
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
        SizedBox(height: 20),
      ],
    );
  }

  loadHadethFile() async {
    String file = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> Ahadith = file.split("#");
    for (String data in Ahadith) {
      //String hadithOne = ahadith[0];
      List<String> lines = data.trim().split("\n");
      String hadithTitle = lines[0];
      lines.removeAt(0);
      List<String> content = lines;
      HadithModel hadithModel =
          HadithModel(title: hadithTitle, content: content);
      ahadith.add(hadithModel);
    }
    setState(() {});
  }
}

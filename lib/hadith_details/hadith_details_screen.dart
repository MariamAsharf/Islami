import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/home/models/hadith_model.dart';
import 'package:islami_app/my_theme/my_theme.dart';

class HadithDetailsScreen extends StatelessWidget {
  static const String routeName = "HadithDetailsScreen";

  HadithDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as HadithModel;
    return Scaffold(
      backgroundColor: Color(0xFF202020),
      appBar: AppBar(
        title: Text(
            "Hadith ",
            style: Theme.of(context).textTheme.titleMedium),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image(
            image: AssetImage("assets/images/details_bg.png"),
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Text(
                      model.title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  SizedBox(height: 26),
                  Text(model.content.first,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/home/tabs/ahadeth_tab/ahadeth_tab.dart';
import 'package:islami_app/home/tabs/dates_tab/dates_tab.dart';
import 'package:islami_app/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami_app/home/tabs/radio_tab/radio_tab.dart';
import 'package:islami_app/home/tabs/sebha_tab/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = "Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/${getBackgroundImageName()}.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          body: tabs[currentindex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentindex,
            onTap: (value) {
              currentindex = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: _buildItem("quran", 0),
                label: "Quran",
              ),
              BottomNavigationBarItem(
                icon: _buildItem("ahadeth", 1),
                label: "Hadith",
              ),
              BottomNavigationBarItem(
                icon: _buildItem("sebha", 2),
                label: "Tasbeeh",
              ),
              BottomNavigationBarItem(
                icon: _buildItem("ic_radio", 3),
                label: "Radio",
              ),
              BottomNavigationBarItem(
                icon: _buildItem("time", 4),
                label: "Time",
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    const SebhaTab(),
    const RadioTab(),
    const DatesTab()
  ];

  String getBackgroundImageName() {
    switch (currentindex) {
      case 0:
        return "home_bg";
      case 1:
        return "ahadeth_bg";
      case 2:
        return "sebha_bg";
      case 3:
        return "radio_bg";
      case 4:
        return "dates";
      default:
        return "home_bg";
    }
  }

  Widget _buildItem(String imageName, int index) {
    return currentindex == index
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0x99202020),
              borderRadius: BorderRadius.circular(66),
            ),
            child: ImageIcon(
              AssetImage("assets/images/$imageName.png"),
            ),
          )
        : ImageIcon(
            AssetImage("assets/images/$imageName.png"),
          );
  }
}

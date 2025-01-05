import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/home/models/sura_model.dart';
import 'package:islami_app/home/tabs/quran_tab/sura_item_hor.dart';
import 'package:islami_app/home/tabs/quran_tab/sura_item_ver.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  void initState() {
    super.initState();
    searchController.addListener(onSearch);
  }

  var searchController = TextEditingController();

  onSearch() {
    SuraModel.searchReaslt.clear();
    String text = searchController.text;
    if (text.isEmpty) {
      for (String data in SuraModel.suraNameEng) {
        if (data.toLowerCase().contains(text.toLowerCase())) {
          SuraModel.searchReaslt.add(data);
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Image(
              image: AssetImage("assets/images/onboarding_header.png"),
              width: 291,
              height: 170,
            ),
            _searchItem(),
            if (SuraModel.searchReaslt.isEmpty &&
                searchController.text.isEmpty) ...[_suraItemHorizental()],

            // SuraModel.searchReaslt.isNotEmpty && searchController.text.isNotEmpty
            //     ? SizedBox()
            //     : _suraItemHorizental(),
            // _suraItemVertical(),
          ],
        ),
      ),
    );
  }

  Widget _suraItemVertical() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Suras List",
            style: GoogleFonts.elMessiri(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: const Color(0xFFFEFFE8),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return SuraItemVer(
                    model: searchController.text.isNotEmpty
                        ? SuraModel.getSelectedSuraModel(index)
                        : SuraModel.getSuraModel(index),
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                      color: Color(0xFFFFFFFF),
                      thickness: 2,
                      indent: 43,
                      endIndent: 43,
                    ),
                itemCount: searchController.text.isNotEmpty
                    ? SuraModel.length
                    : SuraModel.length),
          ),
        ],
      ),
    );
  }

  Widget _suraItemHorizental() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Most Recently",
          style: GoogleFonts.elMessiri(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: const Color(0xFFFEFFE8),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 150,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SuraItemHor(
                  model: SuraModel.getSuraModel(index),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: SuraModel.length),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _searchItem() {
    return Column(
      children: [
        TextField(
          controller: searchController,
          cursorColor: Colors.white,
          style: GoogleFonts.elMessiri(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: const Color(0xFFFEFFE8),
          ),
          decoration: InputDecoration(
            labelText: "Sura Name",
            labelStyle: GoogleFonts.elMessiri(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: const Color(0xFFFEFFE8),
            ),
            prefixIcon: const ImageIcon(
              AssetImage("assets/images/ic_pre_search.png"),
              color: Color(0xFFE2BE7F),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xFFE2BE7F),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xFFE2BE7F),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xFFE2BE7F),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

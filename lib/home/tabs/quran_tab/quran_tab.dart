import 'package:flutter/material.dart';
import 'package:islami_app/home/models/sura_model.dart';
import 'package:islami_app/home/tabs/quran_tab/sura_item_hor.dart';
import 'package:islami_app/home/tabs/quran_tab/sura_item_ver.dart';
import 'package:islami_app/my_theme/my_theme.dart';
import 'package:islami_app/sura_details/sura_details.dart';

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
    if (text.isNotEmpty) {
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

            _suraItemVertical(),
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
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: MYTheme.thirdColor,
                ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        SuraDetailsScreen.routeName,
                        arguments: SuraModel.getSuraModel(index),
                      );
                    },
                    child: SuraItemVer(
                      model: searchController.text.isNotEmpty
                          ? SuraModel.getSelectedSuraModel(index)
                          : SuraModel.getSuraModel(index),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: searchController.text.isNotEmpty
                    ? SuraModel.searchReaslt.length
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
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: MYTheme.thirdColor,
              ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 150,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      SuraDetailsScreen.routeName,
                      arguments: SuraModel.getSuraModel(index),
                    );
                  },
                  child: SuraItemHor(
                    model: SuraModel.getSuraModel(index),
                  ),
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
          cursorColor: MYTheme.thirdColor,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: MYTheme.thirdColor,
              ),
          decoration: InputDecoration(
            labelText: "Sura Name",
            labelStyle: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: MYTheme.thirdColor),
            prefixIcon: ImageIcon(
              AssetImage("assets/images/ic_pre_search.png"),
              color: MYTheme.primaryColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: MYTheme.primaryColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: MYTheme.primaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: MYTheme.primaryColor,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

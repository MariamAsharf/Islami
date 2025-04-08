import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:islami_app/home/tabs/dates_tab/repo/zekr_model.dart';

class AzkarService {
  static Future<ZekrModel> loadAzkarJson() async {
    final String jsonString = await rootBundle.loadString('assets/files/azkar.json');
    final jsonMap = json.decode(jsonString);
    return ZekrModel.fromJson(jsonMap);
  }
}

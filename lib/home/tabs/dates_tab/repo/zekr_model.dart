import 'package:islami_app/home/tabs/dates_tab/repo/zekr_item_model.dart';

class ZekrModel {
  List<ZekrItemModel>? morning;
  List<ZekrItemModel>? evening;
  List<ZekrItemModel>? afterPrayer;
  List<ZekrItemModel>? tasbeeh;
  List<ZekrItemModel>? sleep;
  List<ZekrItemModel>? wakeUp;
  List<ZekrItemModel>? quranic;
  List<ZekrItemModel>? prophets;

  ZekrModel({
    this.morning,
    this.evening,
    this.afterPrayer,
    this.tasbeeh,
    this.sleep,
    this.wakeUp,
    this.quranic,
    this.prophets,
  });

  factory ZekrModel.fromJson(Map<String, dynamic> json) {
    return ZekrModel(
      morning: _fromJsonList(json['أذكار الصباح']),
      evening: _fromJsonList(json['أذكار المساء']),
      afterPrayer: _fromJsonList(json['أذكار بعد السلام من الصلاة المفروضة']),
      tasbeeh: _fromJsonList(json['تسابيح']),
      sleep: _fromJsonList(json['أذكار النوم']),
      wakeUp: _fromJsonList(json['أذكار الاستيقاظ']),
      quranic: _fromJsonList(json['أدعية قرآنية']),
      prophets: _fromJsonList(json['أدعية الأنبياء']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'أذكار الصباح': morning?.map((e) => e.toJson()).toList(),
      'أذكار المساء': evening?.map((e) => e.toJson()).toList(),
      'أذكار بعد السلام من الصلاة المفروضة':
          afterPrayer?.map((e) => e.toJson()).toList(),
      'تسابيح': tasbeeh?.map((e) => e.toJson()).toList(),
      'أذكار النوم': sleep?.map((e) => e.toJson()).toList(),
      'أذكار الاستيقاظ': wakeUp?.map((e) => e.toJson()).toList(),
      'أدعية قرآنية': quranic?.map((e) => e.toJson()).toList(),
      'أدعية الأنبياء': prophets?.map((e) => e.toJson()).toList(),
    };
  }

  static List<ZekrItemModel>? _fromJsonList(dynamic jsonList) {
    if (jsonList is List) {
      return jsonList
          .where((e) => e is Map<String, dynamic>) // تأكد من أن العنصر هو Map
          .map((e) => ZekrItemModel.fromJson(
              e as Map<String, dynamic>)) // تحويل العنصر إلى ZekrItemModel
          .toList();
    }
    return null;
  }
}

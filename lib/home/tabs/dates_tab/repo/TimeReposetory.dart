class TimingsModel {
  final Map<String, String> timings;
  final DateModel date;
  final MetaModel meta;

  TimingsModel({
    required this.timings,
    required this.date,
    required this.meta,
  });

  factory TimingsModel.fromJson(Map<String, dynamic> json) {
    return TimingsModel(
      timings: Map<String, String>.from(json['data']['timings']),
      date: DateModel.fromJson(json['data']['date']),
      meta: MetaModel.fromJson(json['data']['meta']),
    );
  }
}

class DateModel {
  final String readable;
  final String timestamp;
  final HijriModel hijri;
  final GregorianModel gregorian;

  DateModel({
    required this.readable,
    required this.timestamp,
    required this.hijri,
    required this.gregorian,
  });

  factory DateModel.fromJson(Map<String, dynamic> json) {
    return DateModel(
      readable: json['readable'],
      timestamp: json['timestamp'],
      hijri: HijriModel.fromJson(json['hijri']),
      gregorian: GregorianModel.fromJson(json['gregorian']),
    );
  }
}

class HijriModel {
  final String date;
  final String format;
  final String day;
  final WeekdayModel weekday;
  final MonthModel month;
  final String year;

  HijriModel({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
  });

  factory HijriModel.fromJson(Map<String, dynamic> json) {
    return HijriModel(
      date: json['date'],
      format: json['format'],
      day: json['day'],
      weekday: WeekdayModel.fromJson(json['weekday']),
      month: MonthModel.fromJson(json['month']),
      year: json['year'],
    );
  }
}

class GregorianModel {
  final String date;
  final String format;
  final String day;
  final WeekdayModel weekday;
  final MonthModel month;
  final String year;

  GregorianModel({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
  });

  factory GregorianModel.fromJson(Map<String, dynamic> json) {
    return GregorianModel(
      date: json['date'],
      format: json['format'],
      day: json['day'],
      weekday: WeekdayModel.fromJson(json['weekday']),
      month: MonthModel.fromJson(json['month']),
      year: json['year'],
    );
  }
}

class WeekdayModel {
  final String en;
  final String ar;

  WeekdayModel({
    required this.en,
    required this.ar,
  });

  factory WeekdayModel.fromJson(Map<String, dynamic> json) {
    return WeekdayModel(
      en: json['en'],
      ar: json['ar'],
    );
  }
}

class MonthModel {
  final String number;
  final String en;
  final String ar;
  final String days;

  MonthModel({
    required this.number,
    required this.en,
    required this.ar,
    required this.days,
  });

  factory MonthModel.fromJson(Map<String, dynamic> json) {
    return MonthModel(
      number: json['number'],
      en: json['en'],
      ar: json['ar'],
      days: json['days'],
    );
  }
}

class MetaModel {
  final double latitude;
  final double longitude;
  final String timezone;
  final MethodModel method;

  MetaModel({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.method,
  });

  factory MetaModel.fromJson(Map<String, dynamic> json) {
    return MetaModel(
      latitude: json['latitude'],
      longitude: json['longitude'],
      timezone: json['timezone'],
      method: MethodModel.fromJson(json['method']),
    );
  }
}

class MethodModel {
  final int id;
  final String name;
  final Map<String, double> params;
  final LocationModel location;

  MethodModel({
    required this.id,
    required this.name,
    required this.params,
    required this.location,
  });

  factory MethodModel.fromJson(Map<String, dynamic> json) {
    return MethodModel(
      id: json['id'],
      name: json['name'],
      params: Map<String, double>.from(json['params']),
      location: LocationModel.fromJson(json['location']),
    );
  }
}

class LocationModel {
  final double latitude;
  final double longitude;

  LocationModel({
    required this.latitude,
    required this.longitude,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}

abstract class TimingsState {}

class TimingsInitial extends TimingsState {}

class TimingsLoading extends TimingsState {}

class TimingsSuccess extends TimingsState {
  final Map<String, String> timings;
  final String nextPrayerTime;
  final String gregorianDate;
  final String hijriDate;
  final String weekday;

  TimingsSuccess(
      this.timings, this.nextPrayerTime, this.gregorianDate, this.hijriDate, this.weekday);

  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TimingsSuccess && other.timings == timings;
  }

  @override
  int get hashCode => timings.hashCode;
}

class TimingsError extends TimingsState {
  final String message;

  TimingsError(this.message);

  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TimingsError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

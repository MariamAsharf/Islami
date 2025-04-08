import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:islami_app/home/tabs/dates_tab/timing_state.dart';
import 'package:just_audio/just_audio.dart';
import 'package:permission_handler/permission_handler.dart';

class TimingsCubit extends Cubit<TimingsState> {
  TimingsCubit() : super(TimingsInitial());

  bool isAdhanSoundOn = true;
  final player = AudioPlayer();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Timer? _notificationTimer;

  Future<void> fetchTimings(BuildContext context) async {
    emit(TimingsLoading());

    PermissionStatus permissionStatus = await Permission.location.request();
    if (permissionStatus.isGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        double latitude = position.latitude;
        double longitude = position.longitude;

        String city = await _getCityFromCoordinates(latitude, longitude);
        String currentDate = DateFormat('d-M-yyyy').format(DateTime.now());

        final response = await http.get(Uri.parse(
            'https://api.aladhan.com/v1/timingsByCity/$currentDate?city=$city&country=egypt'));

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          if (data['code'] == 200 &&
              data['data'] != null &&
              data['data']['timings'] != null) {
            final Map<String, dynamic> timings = data['data']['timings'];

            final String gregorianDate = data['data']['date']['readable'] ?? "";
            final String hijriDate = data['data']['date']['hijri']['date'] ?? "";
            final String weekday =
                data['data']['date']['gregorian']['weekday']['en'] ?? "";

            final Map<String, String> formattedTimings = {
              "Fajr": timings['Fajr'] ?? "00:00",
              "Sunrise": timings['Sunrise'] ?? "00:00",
              "Dhuhr": timings['Dhuhr'] ?? "00:00",
              "Asr": timings['Asr'] ?? "00:00",
              "Sunset": timings['Sunset'] ?? "00:00",
              "Maghrib": timings['Maghrib'] ?? "00:00",
              "Isha": timings['Isha'] ?? "00:00",
              "Imsak": timings['Imsak'] ?? "00:00",
              "Midnight": timings['Midnight'] ?? "00:00",
              "Firstthird": timings['Firstthird'] ?? "00:00",
              "Lastthird": timings['Lastthird'] ?? "00:00"
            };

            String nextPrayerTime = _getNextPrayerTime(formattedTimings);

            emit(TimingsSuccess(formattedTimings, nextPrayerTime,
                gregorianDate, hijriDate, weekday));

            // بدء فحص التوقيتات لتشغيل الإشعارات
            checkPrayerTimeForNotification(formattedTimings);
          } else {
            emit(TimingsError('Invalid data from server'));
          }
        } else {
          emit(TimingsError('Failed to load timings'));
        }
      } catch (e) {
        emit(TimingsError('An error occurred: $e'));
      }
    } else {
      await _showLocationPermissionDialog(context);
    }
  }

  String _getNextPrayerTime(Map<String, String> timings) {
    DateTime currentTime = DateTime.now();
    for (var entry in timings.entries) {
      DateTime prayerTime = _convertTimeToDateTime(entry.value);
      if (prayerTime.isAfter(currentTime)) {
        return entry.value;
      }
    }
    return 'No more prayers today';
  }

  DateTime _convertTimeToDateTime(String timeString) {
    List<String> timeParts = timeString.split(':');
    int hours = int.parse(timeParts[0]);
    int minutes = int.parse(timeParts[1]);
    return DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, hours, minutes);
  }

  Future<String> _getCityFromCoordinates(
      double latitude, double longitude) async {
    final url =
        'https://api.opencagedata.com/geocode/v1/json?q=$latitude+$longitude&key=YOUR_API_KEY';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['results'][0]['components']['city'] ?? 'Unknown';
      } else {
        return 'Cairo';
      }
    } catch (e) {
      return 'Cairo';
    }
  }

  Future<void> _showLocationPermissionDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Permission Required'),
        content: Text(
            'We need your location to show prayer times. Please allow location access.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettings();
            },
            child: Text('Open Settings'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              emit(TimingsError('Location permission denied'));
            },
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void toggleAdhanSound() {
    isAdhanSoundOn = !isAdhanSoundOn;
    emit(state); // إعادة البناء للتحديث
  }

  void checkPrayerTimeForNotification(Map<String, String> timings) {
    _notificationTimer?.cancel(); // نلغي أي تايمر سابق

    _notificationTimer = Timer.periodic(Duration(minutes: 1), (timer) async {
      final now = DateTime.now();
      final currentTime = DateFormat('HH:mm').format(now);

      timings.forEach((name, time) async {
        if (time == currentTime) {
          await _showPrayerNotification(name);

          if (isAdhanSoundOn) {
            await player.setAsset('assets/audio/adhan.mp3');
            player.play();
          }
        }
      });
    });
  }

  Future<void> _showPrayerNotification(String prayerName) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'adhan_channel',
      'Prayer Notifications',
      importance: Importance.max,
      priority: Priority.high,
      playSound: false,
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      '🕌 وقت صلاة $prayerName',
      'حان الآن موعد صلاة $prayerName',
      notificationDetails,
    );
  }

  @override
  Future<void> close() {
    _notificationTimer?.cancel();
    player.dispose();
    return super.close();
  }
}

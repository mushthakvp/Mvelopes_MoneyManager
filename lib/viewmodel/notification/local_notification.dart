import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();
  dynamic locationName;

  Future init({bool initScheduled = false}) async {
    const android = AndroidInitializationSettings("logo");
    const settings = InitializationSettings(android: android);
    await _notifications.initialize(
      settings,
      onSelectNotification: (payload) async {
        onNotifications.add(payload);
      },
    );
    if (initScheduled) {
      tz.initializeTimeZones();
      locationName = await FlutterNativeTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(locationName));
    }
  }

  static Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails('channel id', 'channel name', importance: Importance.max),
    );
  }

  static Future showScheduledNotifications({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    required Time scheduledTime,
  }) async {
    return _notifications.zonedSchedule(id, title, body, _scheduledDaily(scheduledTime), await _notificationDetails(), uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime, androidAllowWhileIdle: true, matchDateTimeComponents: DateTimeComponents.time);
  }

  static tz.TZDateTime _scheduledDaily(Time time) {
    final now = tz.TZDateTime.now(tz.local).add(Duration(hours: time.hour, minutes: time.minute, seconds: 0));
    final scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
      time.second,
    );
    return scheduledDate.isBefore(now) ? scheduledDate.add(const Duration(days: 1)) : scheduledDate;
  }
}

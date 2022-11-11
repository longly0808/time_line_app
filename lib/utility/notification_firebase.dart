import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationFirebase {
  static final _notificationFirebase = FlutterLocalNotificationsPlugin();


  static Future<NotificationDetails> _notificationDetail() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        channelDescription: 'channel description',
        importance: Importance.max,
      ),
    );
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? description,
    String? payload,
  }) async {
    await _notificationFirebase.initialize(
      const InitializationSettings(),
      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async {
        // ...
      },
      onDidReceiveBackgroundNotificationResponse: (value){},
    );

    _notificationFirebase.show(
      id,
      title,
      description,
      await _notificationDetail(),
      payload: payload,
    );
  }
}

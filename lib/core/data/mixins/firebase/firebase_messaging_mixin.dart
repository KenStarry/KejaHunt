import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../di/locator.dart';

mixin FirebaseMessagingMixin {
  final messaging = locator.get<FirebaseMessaging>();

  /// Get FCM Token
  Future<String?> getFCMToken() async {
    String? fcmToken = await messaging.getToken();

    return fcmToken;
  }
}

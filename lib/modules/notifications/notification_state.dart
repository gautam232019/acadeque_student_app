import 'package:acadeque_student_app/core/http/http.dart';
import 'package:acadeque_student_app/core/state/base_state.dart';
import 'package:acadeque_student_app/modules/notifications/models/notification_response.dart';
import 'package:dio/dio.dart';

class NotificationState extends BaseState {
  Dio dio = getHttp();
  NotificationResponse? notificationState;

  NotificationState() {
    getNotifications();
  }

  getNotifications() async {
    setLoading(true);
    try {
      final response = await dio.get("/notifications");
      notificationState = NotificationResponse.fromJson(response.data);
      notifyListeners();
      // ignore: empty_catches
    } catch (err) {}
    setLoading(false);
  }
}

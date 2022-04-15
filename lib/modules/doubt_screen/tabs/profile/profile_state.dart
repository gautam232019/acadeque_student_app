import 'package:acadeque_student_app/core/http/http.dart';
import 'package:acadeque_student_app/core/services/local_storage_service.dart';
import 'package:acadeque_student_app/core/state/base_state.dart';
import 'package:acadeque_student_app/modules/doubt_screen/doube_state.dart';
import 'package:acadeque_student_app/modules/doubt_screen/models/user_detail_response.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decode/jwt_decode.dart';

class ProfileState extends BaseState {
  Dio dio = getHttp();

  ProfileState() {
    getToken();
    getUserDetail();
  }

  String? token;
  String id = "";

  Map<String, dynamic>? user;

  userDetailResponse? userDetailState;

  UserResponse? userState;

  getToken() {
    setLoading(true);
    token = LocalStorageService().read(LocalStorageKeys.accessToken) ?? "";
    notifyListeners();
    Map<String, dynamic> user = Jwt.parseJwt(token!);
    id = user["userId"] as String;
    notifyListeners();
    // print(userState?.userId!);
  }

  getUserDetail() async {
    if (id.isNotEmpty) {
      try {
        final response = await dio.get("/students/$id");
        userDetailState = userDetailResponse.fromJson(response.data);
        notifyListeners();
        // ignore: empty_catches
      } catch (err) {}
    }
    setLoading(false);
  }
}

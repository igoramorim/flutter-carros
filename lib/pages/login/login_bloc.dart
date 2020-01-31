import 'dart:async';

import 'package:carros/pages/api_response.dart';
import 'package:carros/pages/login/login_api.dart';
import 'package:carros/pages/user.dart';

class LoginBloc {

  final _streamController = StreamController<bool>();
  Stream<bool> get stream => _streamController.stream;

  Future<ApiResponse<User>> login(String login, String password) async {
    _streamController.add(true);
    ApiResponse response = await LoginApi.login(login, password);
    _streamController.add(false);
    return response;
  }

  void dispose() {
    _streamController.close();
  }

}

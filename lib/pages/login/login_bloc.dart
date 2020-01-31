import 'dart:async';

import 'package:carros/pages/api_response.dart';
import 'package:carros/pages/car/simple_bloc.dart';
import 'package:carros/pages/login/login_api.dart';
import 'package:carros/pages/user.dart';

class LoginBloc {

  final buttonBloc = SimpleBloc<bool>();

  Future<ApiResponse<User>> login(String login, String password) async {
    buttonBloc.add(true);
    ApiResponse response = await LoginApi.login(login, password);
    buttonBloc.add(false);
    return response;
  }

  void dispose() {
    buttonBloc.dispose();
  }

}

import 'package:http/http.dart' as http;

class LoginApi {
  static Future<bool> login(String login, String password) async {

    var url = 'http://livrowebservices.com.br/rest/login';
    final params = {
      'login': login,
      'senha': password,
    };

    var response = await http.post(url, body: params);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return true;
  }
}

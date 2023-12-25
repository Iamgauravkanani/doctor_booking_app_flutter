import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../model/users_model.dart';

class LoginApiHelper {
  LoginApiHelper._();

  static final LoginApiHelper loginApiHelper = LoginApiHelper._();

  Future<bool?> login({required LoginModel logindata}) async {
    String api = "http://myhealth.hiteck-consulting.com/api/login.php";

    http.Response res = await http.get(
      Uri.parse(api),
    );

    log("${res.statusCode}");
    log(res.body);
    if (res.statusCode == 200) {
      var decodedData = jsonDecode(res.body);
      List data = decodedData['data'];
      log("$data");
      bool isLogin = data.any((e) =>
          e['email'] == logindata.email && e['password'] == logindata.password);
      log("$isLogin");
      return isLogin;
    } else {
      return null;
    }
  }
}

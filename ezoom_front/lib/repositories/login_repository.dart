import 'dart:convert';

import 'package:ezoom_front/viewModel/user_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository {
  final urlBaseAPI = dotenv.env['URL_BASE_API'];

  Future<bool> login(UserViewModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final Uri url = Uri.parse('${urlBaseAPI}autenticate');
      final res = await http.post(url,
          headers: {
            "content-type": "application/json",
          },
          body: user.toJson());
      final Map<String, dynamic> responseData = jsonDecode(res.body);
      if (res.statusCode == 200 &&
          responseData['success'] &&
          responseData['token'] != null) {
        await prefs.setString('token', responseData['token']);
        debugPrint("Login successfully ${responseData['token']}");
        return true;
      } else {
        debugPrint('Failed to Login response');
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}

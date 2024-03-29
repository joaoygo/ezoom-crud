import 'dart:convert';

import 'package:ezoom_front/viewModel/user_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class RegisterRepository {
  final urlBaseAPI = dotenv.env['URL_BASE_API'];

  Future<void> register(UserViewModel user) async {
    try {
      final Uri url = Uri.parse('${urlBaseAPI}register');
      final res = await http.post(url,
          headers: {
            "content-type": "application/json",
          },
          body: user.toJson());
      final Map<String, dynamic> responseData = jsonDecode(res.body);
      if (res.statusCode == 201 &&
          responseData['message'] == 'User created successfully') {
        debugPrint("Register successfully");
      } else {
        debugPrint('Failed to register response');
      }
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:ezoom_front/repositories/login_repository.dart';
import 'package:ezoom_front/viewModel/user_view_model.dart';
import 'package:flutter/foundation.dart';

class LoginController {
  final LoginRepository _repository = LoginRepository();

  Future<void> loginUser(UserViewModel user) async {
    try {
      _repository.login(user);
    } on Exception catch (e) {
      debugPrint('$e');
      rethrow;
    }
  }
}

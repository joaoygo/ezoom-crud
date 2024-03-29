import 'package:ezoom_front/repositories/login_repository.dart';
import 'package:ezoom_front/viewModel/user_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class LoginController {
  final LoginRepository _repository = LoginRepository();
  RxBool isLoading = false.obs;

  Future<bool> loginUser(UserViewModel user) async {
    try {
      bool isLogSuccess = await _repository.login(user);
      if (isLogSuccess) {
        return true;
      }
      return false;
    } on Exception catch (e) {
      debugPrint('$e');
      rethrow;
    }
  }
}

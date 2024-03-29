import 'package:ezoom_front/repositories/register_repository.dart';
import 'package:ezoom_front/viewModel/user_view_model.dart';
import 'package:flutter/foundation.dart';

class RegisterController {
  final RegisterRepository _repository = RegisterRepository();

  Future<bool> registerUser(UserViewModel user) async {
    try {
      bool isRegSuccess = await _repository.register(user);
      if (isRegSuccess) {
        return true;
      }
      return false;
    } on Exception catch (e) {
      debugPrint('$e');
      rethrow;
    }
  }
}

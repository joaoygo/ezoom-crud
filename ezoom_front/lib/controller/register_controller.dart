import 'package:ezoom_front/repositories/register_repository.dart';
import 'package:ezoom_front/viewModel/user_view_model.dart';
import 'package:flutter/foundation.dart';

class RegisterController {
  final RegisterRepository _repository = RegisterRepository();

  Future<void> registerUser(UserViewModel user) async {
    try {
      _repository.register(user);
    } on Exception catch (e) {
      debugPrint('$e');
      rethrow;
    }
  }
}

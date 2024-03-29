import 'dart:convert';

class UserViewModel {
  String? name;
  String email;
  String password;
  UserViewModel({
    this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory UserViewModel.fromMap(Map<String, dynamic> map) {
    return UserViewModel(
      email: map['email'] as String,
      password: map['password'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserViewModel.fromJson(String source) =>
      UserViewModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserViewModel(email: $email, password: $password)';
}

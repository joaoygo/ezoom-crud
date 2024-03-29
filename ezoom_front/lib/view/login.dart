import 'package:ezoom_front/controller/login_controller.dart';
import 'package:ezoom_front/view/dashboard.dart';
import 'package:ezoom_front/view/register.dart';
import 'package:ezoom_front/viewModel/user_view_model.dart';
import 'package:ezoom_front/widgets/button_gradiente.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final LoginController _controller = LoginController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
          color: Colors.white,
          child: ListView(
            children: [
              const SizedBox(
                width: 128,
                height: 128,
                child: Icon(
                  Icons.task_alt,
                  size: 50,
                  color: Color(0xFFF58524),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira seu e-mail';
                  }
                  if (!RegExp(r'\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b',
                          caseSensitive: false)
                      .hasMatch(value)) {
                    return 'Por favor, insira um e-mail válido';
                  }
                  return null;
                },
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _passwordController,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira sua senha';
                  }
                  return null;
                },
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 40,
              ),
              ButtonGradiente(
                txt: 'Login',
                icon: const Icon(Icons.login),
                onTap: () {
                  void showBar(BuildContext context, String text) {
                    final snackBar = SnackBar(content: Text(text));
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }

                  if (_formKey.currentState!.validate()) {
                    showBar(context, 'Carregando ...');
                    _controller.loginUser(UserViewModel(
                        email: _emailController.text,
                        password: _passwordController.text));

                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const Dashboard(),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                child: GestureDetector(
                  child: const Text(
                    "Cadastre-se",
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Register(),
                    ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

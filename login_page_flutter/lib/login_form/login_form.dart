import 'package:flutter/material.dart';
import 'package:login_page_flutter/styled_component/styled_button.dart';
import 'package:login_page_flutter/styled_component/styled_text_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final username = ["admin", "user"];
  final pw = "123456";

  void onPressLogin() {
    final String usernameTxt = _usernameController.text;
    final String passwordTxt = _passwordController.text;

    if (username.contains(usernameTxt) && passwordTxt == pw) {
      showAlertDialog(context, 'Success', "Login successfully");
    } else{
      showAlertDialog(context, 'Fail', "Login fail");
    }
      
  }

  void showAlertDialog(BuildContext context, String title, String content) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(title: Text(title), content: Text(content));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
        children: [
          const Text('Username'),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              child: StyledTextFormField(
                'Enter your username',
                controller: _usernameController,
              )),
          const Text('Password'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: StyledTextFormField("Enter your password",
                controller: _passwordController),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              child: StyledButton(
                  onPressed: onPressLogin, child: const Text("Login")))
        ],
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

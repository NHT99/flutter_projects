import 'package:flutter/material.dart';
import 'package:login_page_flutter/login_form/login_form.dart';

void main() {
  runApp(const MaterialApp(
    home: LoginScreen(),
  ));
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: const Color.fromARGB(255, 237, 233, 228),
            child: const Text('Hello'),
          ),
          Container(
            color: Colors.grey[300],
            padding: const EdgeInsets.all(20),
            child: const LoginForm(),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // * Used to avoid app rendering errors on phones with small screens.
      padding: EdgeInsets.all(8.0),

      child: Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Login'),
          ),
        ),
      ),
    );
  }
}

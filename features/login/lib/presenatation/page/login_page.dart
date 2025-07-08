import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login/presenatation/page/login_page_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginPageBody() ,
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:login/presenatation/widget/email_field.dart';
import 'package:login/presenatation/widget/login_button.dart';
import 'package:login/presenatation/widget/password_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  void _submit() {
    if (formKey.currentState!.validate()) {
      // Call login logic
      print('Email: ${emailController.text}');
      print('Password: ${passwordController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmailField(
              controller: emailController,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Enter email';
                }
                if (!val.contains('@')) {
                  return 'Enter valid email';
                }
                return null;
              }),
          const SizedBox(height: 16),
          PasswordField(
              controller: passwordController,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Enter password';
                }
                if (val.length < 6) {
                  return 'Enter min 6 chars';
                }
                return null;
              }),
          const SizedBox(height: 24),
          LoginButton(
            onPressed: _submit,
            isLoading: isLoading,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/presenatation/cubit/login/login_cubit.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          setState(() {
            isLoading = true;
          });
        } else if (state is LoginSuccess) {
          setState(() {
            isLoading = false;
          });
          // Handle successful login, e.g., navigate to home screen
          print('Login successful: ${state.loginEntity}');
        } else if (state is LoginFailure) {
          setState(() {
            isLoading = false;
          });
          // Show error message
          print('Login failed: ${state.errorMessage}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
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
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<LoginCubit>().login(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                  }
                },
                isLoading: isLoading,
              ),
            ],
          ),
        );
      },
    );
  }
}

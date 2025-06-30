import 'package:cache/cache_helper.dart';
import 'package:constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
// import 'package:login/data/local_data/login_local_data_scurce.dart';
// import 'package:login/data/local_data/login_local_data_scurce.dart';
// import 'package:login/data/local_data/login_local_data_scurce_impl.dart';
// import 'package:login/data/model/login_model.dart';
import 'package:login/presenatation/cubit/login/login_cubit.dart';
import 'package:login/presenatation/widget/email_field.dart';
import 'package:login/presenatation/widget/login_button.dart';
import 'package:login/presenatation/widget/password_field.dart';
import 'package:routing/router_name.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // LoginModel? user;

  // @override
  // void initState() {
  //   super.initState();
  //   _loadUserData();
  // }

  // Future<void> _loadUserData() async {
  //   final localDataSource = getIt<LoginLocalDataSource>();

  //   final cachedUser = await localDataSource.getCachedLoginData();
  //   if (cachedUser != null) {
  //     setState(() {
  //       user = cachedUser;
  //     });
  //   }
  // }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async{
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
          await CacheHelper().saveData(key: AppConstants.iSLOGIN, value: true);
          context.pushReplacementNamed(RouterName.bottonNavWithAnimatedIcons);
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

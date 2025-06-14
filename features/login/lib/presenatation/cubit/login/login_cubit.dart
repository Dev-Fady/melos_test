import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/domain/entites/login_entity.dart';
import 'package:login/domain/repository/login_repository.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepository}) : super(LoginInitial());
  final LoginRepository loginRepository;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    final result =
        await loginRepository.login(email: email, password: password);
    result.fold(
      (failure) => emit(LoginFailure(errorMessage: failure.message)),
      (loginEntity) => emit(LoginSuccess(loginEntity: loginEntity)),
    );
  }
}

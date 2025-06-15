part of 'home_cubit_cubit.dart';

@immutable
sealed class HomeCubitState {}

final class HomeCubitInitial extends HomeCubitState {}

final class HomeLoading extends HomeCubitState {}

final class HomeSuccess extends HomeCubitState {
  final HomeEntity homeEntity;

  HomeSuccess({required this.homeEntity});
}

final class HomeFailure extends HomeCubitState {
  final String errorMessage;

  HomeFailure({required this.errorMessage});
}

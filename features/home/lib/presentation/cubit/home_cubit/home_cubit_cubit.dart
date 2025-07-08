import 'package:bloc/bloc.dart';
import 'package:home/domain/entites/home_entity.dart';
import 'package:home/domain/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_cubit_state.dart';

class HomeCubitCubit extends Cubit<HomeCubitState> {
  HomeCubitCubit({required this.homeRepo}) : super(HomeCubitInitial());

  final HomeRepo homeRepo;

  Future<void> getHomedata() async {
    emit(HomeLoading());
    final reslut = await homeRepo.getHomeData();
    reslut.fold(
      (failure) => emit(HomeFailure(errorMessage: failure.message)),
      (homeEntity) => emit(HomeSuccess(homeEntity: homeEntity)),
    );
  }
}

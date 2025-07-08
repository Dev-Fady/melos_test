import 'package:home/data/model/home_model.dart';

abstract class HomeLocalDataSource {
  Future<void> cacheHomeData({required HomeModel homeModel});
  Future<HomeModel?> getCachedHomeData();
  Future<void> clearCachedHomeData();
}

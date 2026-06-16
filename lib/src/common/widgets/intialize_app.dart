import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tsk_4/src/common/dependency/appdependency.dart';
import 'package:tsk_4/src/common/service/api_service.dart';
import 'package:tsk_4/src/common/service/photo_service.dart';
import 'package:tsk_4/src/features/home/data/weather_repository.dart';
import 'package:tsk_4/src/features/main/data/photo_repository.dart';

class InitializeApp {
  Future<AppDependency> initialize() async {
    final shp = await SharedPreferences.getInstance();
    final apiService = ApiService(dio: Dio());
    final photoService = PhotoService(dio: Dio());
    final weatherRepository = WeatherRepositoryImpl(apiService: apiService);
    final photoRepository = PhotoRepositoryImpl(photoService: photoService);
    return AppDependency(
      shp,
      apiService: apiService,
      weatherRepository: weatherRepository,
      photoRepository: photoRepository,
    );
  }
}

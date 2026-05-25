import 'package:dio/dio.dart';
import 'package:tsk_4/src/common/dependency/appdependency.dart';
import 'package:tsk_4/src/common/service/api_service.dart';
import 'package:tsk_4/src/features/home/controller/weather_controller.dart';
import 'package:tsk_4/src/features/home/data/weather_repository.dart';

class InitializeApp {
  Future<AppDependency> initialize() async {
    return AppDependency(
      weatherController: WeatherController(
        weatherRepository: WeatherRepositoryImpl(
          apiService: ApiService(dio: Dio()),
        ),
      ),
      weatherRepository: WeatherRepositoryImpl(
        apiService: ApiService(dio: Dio()),
      ),
      apiService: ApiService(dio: Dio()),
    );
  }
}

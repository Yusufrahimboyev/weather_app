import 'package:tsk_4/src/common/service/api_service.dart';

abstract class WeatherRepository {
  Future<Map<String, dynamic>> getWeather(String cityName);
}

class WeatherRepositoryImpl implements WeatherRepository {
  final ApiService apiService;

  WeatherRepositoryImpl({required this.apiService});
  @override
  Future<Map<String, dynamic>> getWeather(String cityName) {
    return apiService.request(cityName);
  }
}

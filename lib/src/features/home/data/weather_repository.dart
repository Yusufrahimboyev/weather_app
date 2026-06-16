import 'package:tsk_4/src/common/model/weather_model.dart';
import 'package:tsk_4/src/common/service/api_service.dart';

abstract class WeatherRepository {
  Future<WeatherModelList> getWeather(String cityName);
}

class WeatherRepositoryImpl implements WeatherRepository {
  final ApiService apiService;

  WeatherRepositoryImpl({required this.apiService});

  @override
  Future<WeatherModelList> getWeather(String cityName) {
    return apiService.request(cityName);
  }
}

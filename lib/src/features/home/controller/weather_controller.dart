import 'package:tsk_4/src/features/home/data/weather_repository.dart';

abstract class IWeatherController {
  Future<Map<String, dynamic>> getWeather(String cityName);
}

class WeatherController extends IWeatherController {
  WeatherController({required this.weatherRepository});
  final WeatherRepositoryImpl weatherRepository;

  @override
  Future<Map<String, dynamic>> getWeather(String cityName) async {
    return await weatherRepository.getWeather(cityName);
  }
}

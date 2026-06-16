import 'package:tsk_4/src/common/model/weather_model.dart';
import 'package:tsk_4/src/features/home/data/weather_repository.dart';

abstract class WeatherController {
  Future<WeatherModelList> getWeather(String cityName);
}

class IWeatherController extends WeatherController {
  IWeatherController({required this.weatherRepository});
  final WeatherRepositoryImpl weatherRepository;

  @override
  Future<WeatherModelList> getWeather(String cityName) async {
    return await weatherRepository.getWeather(cityName);
  }
}

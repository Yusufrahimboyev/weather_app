import 'package:tsk_4/src/common/service/api_service.dart';
import 'package:tsk_4/src/features/home/controller/weather_controller.dart';
import 'package:tsk_4/src/features/home/data/weather_repository.dart';

class AppDependency {
  AppDependency({
    required this.weatherController,
    required this.weatherRepository,
    required this.apiService,
  });
  final IWeatherController weatherController;
  final WeatherRepositoryImpl weatherRepository;
  final ApiService apiService;
}

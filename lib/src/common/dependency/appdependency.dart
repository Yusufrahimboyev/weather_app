import 'package:shared_preferences/shared_preferences.dart';
import 'package:tsk_4/src/common/service/api_service.dart';
import 'package:tsk_4/src/features/home/data/weather_repository.dart';
import 'package:tsk_4/src/features/main/data/photo_repository.dart';

class AppDependency {
  AppDependency(
    this.sharedPreferences, {
    required this.apiService,
    required this.photoRepository,
    required this.weatherRepository,
  });

  final WeatherRepositoryImpl weatherRepository;
  final ApiService apiService;
  final SharedPreferences sharedPreferences;
  final PhotoRepositoryImpl photoRepository;
}

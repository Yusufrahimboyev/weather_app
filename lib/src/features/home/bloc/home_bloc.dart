import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tsk_4/src/common/constants/constants.dart';
import 'package:tsk_4/src/common/model/weather_model.dart';
import 'package:tsk_4/src/common/utils/status_enum.dart';
import 'package:tsk_4/src/features/home/data/weather_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required WeatherRepository weatherRepository,
    required SharedPreferences sharedPreferences,
  }) : _weatherRepository = weatherRepository,
       _sharedPreferences = sharedPreferences,
       super(
         HomeState(
           cities:
               sharedPreferences.getStringList(Constants.savedCitiesKey) ??
               const <String>["Tashkent"],
           weatherModelList: WeatherModelList(weatherdata: <WeatherModel>[]),
         ),
       ) {
    on<HomeEvent>(
      (event, emit) => switch (event) {
        GetWeatherList$HomeEvent() => _getWeatherList(event, emit),
        AddCity$HomeEvent() => _addCity(event, emit),
        RemoveCity$HomeEvent() => _removeCity(event, emit),
      },
    );

    final cities = state.cities;
    if (cities.isNotEmpty) {
      add(GetWeatherList$HomeEvent(cities.first));
    }
  }
  final WeatherRepository _weatherRepository;
  final SharedPreferences _sharedPreferences;
  Future<void> _getWeatherList(
    GetWeatherList$HomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final weatherlist = await _weatherRepository.getWeather(event.cityName);
      if (weatherlist.weatherdata.isEmpty) {
        emit(
          state.copyWith(
            weatherModelList: weatherlist,
            status: Status.error,
            errorMessage: "No weather data returned for '${event.cityName}'",
          ),
        );
        return;
      }
      final first = weatherlist.weatherdata.first;
      final existing = state.weatherdata;
      final index = existing.indexWhere(
        (w) => w.cityName.toLowerCase() == first.cityName.toLowerCase(),
      );
      final updatedList = List<WeatherModel>.from(existing);
      if (index >= 0) {
        updatedList[index] = first;
      } else {
        updatedList.add(first);
      }
      final selectedIndex = updatedList.indexWhere(
        (w) => w.cityName.toLowerCase() == first.cityName.toLowerCase(),
      );
      if (selectedIndex > 0) {
        updatedList.removeAt(selectedIndex);
        updatedList.insert(0, first);
      }
      emit(
        state.copyWith(
          status: Status.success,
          weatherdata: updatedList,
          weatherModelList: weatherlist,
        ),
      );
    } catch (e) {
      final msg = e is Exception
          ? e.toString().replaceFirst('Exception: ', '')
          : e.toString();
      emit(state.copyWith(status: Status.error, errorMessage: msg));
    }
  }

  Future<void> _addCity(
    AddCity$HomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final weather = await _weatherRepository.getWeather(event.newCity);
      if (weather.weatherdata.isEmpty) {
        emit(
          state.copyWith(
            status: Status.error,
            errorMessage: "Shahar topilmadi!",
          ),
        );
        return;
      }
      final nCity = weather.weatherdata.first.cityName;
      final existingIndex = state.weatherdata.indexWhere(
        (w) => w.cityName.toLowerCase() == nCity.toLowerCase(),
      );
      if (existingIndex >= 0) {
        final reordered = List<WeatherModel>.from(state.weatherdata);
        final entry = reordered.removeAt(existingIndex);
        reordered.insert(0, entry);
        emit(state.copyWith(status: Status.success, weatherdata: reordered));
        return;
      }

      final cities = state.cities + [nCity];
      await _sharedPreferences.setStringList(Constants.savedCitiesKey, cities);
      emit(
        state.copyWith(
          status: Status.success,
          weatherdata: [...state.weatherdata, weather.weatherdata.first],
          cities: cities,
        ),
      );
    } catch (e) {
      final msg = e is Exception
          ? e.toString().replaceFirst('Exception: ', '')
          : e.toString();
      emit(state.copyWith(status: Status.error, errorMessage: msg));
    }
  }

  Future<void> _removeCity(
    RemoveCity$HomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final cities = state.cities
          .where((c) => c.toLowerCase() != event.cityName.toLowerCase())
          .toList();
      final weatherdata = state.weatherdata
          .where(
            (w) => w.cityName.toLowerCase() != event.cityName.toLowerCase(),
          )
          .toList();
      await _sharedPreferences.setStringList(Constants.savedCitiesKey, cities);
      emit(
        state.copyWith(
          status: Status.success,
          cities: cities,
          weatherdata: weatherdata,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: Status.error, errorMessage: e.toString()));
    }
  }
}

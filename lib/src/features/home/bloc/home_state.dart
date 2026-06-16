part of 'home_bloc.dart';

class HomeState extends Equatable {
  final Status status;
  final List<WeatherModel> weatherdata;
  final String? errorMessage;
  final List<String> cities;
  final WeatherModelList weatherModelList;

  const HomeState({
    this.weatherdata = const <WeatherModel>[],
    this.status = Status.initial,
    this.cities = const <String>["Tashkent"],
    this.errorMessage,
    required this.weatherModelList,
  });
  HomeState copyWith({
    Status? status,
    WeatherModelList? weatherModelList,
    List<WeatherModel>? weatherdata,
    List<String>? cities,
    String? errorMessage,
  }) => HomeState(
    weatherdata: weatherdata ?? this.weatherdata,
    status: status ?? this.status,
    cities: cities ?? this.cities,
    errorMessage: errorMessage,
    weatherModelList: weatherModelList ?? this.weatherModelList,
  );
  @override
  List<Object?> get props => [
    status,
    weatherdata,
    errorMessage,
    cities,
    weatherModelList,
  ];
}

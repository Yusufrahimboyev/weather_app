part of 'home_bloc.dart';

sealed class HomeEvent {
  const HomeEvent();
}

final class GetWeatherList$HomeEvent extends HomeEvent {
  final String cityName;
  const GetWeatherList$HomeEvent(this.cityName);
}

final class AddCity$HomeEvent extends HomeEvent {
  final String newCity;
  const AddCity$HomeEvent(this.newCity);
}

final class RemoveCity$HomeEvent extends HomeEvent {
  final String cityName;
  const RemoveCity$HomeEvent(this.cityName);
}

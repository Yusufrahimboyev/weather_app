part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

final class GetWeather$HomeEvent extends HomeEvent {
  final String city;

  const GetWeather$HomeEvent({required this.city});

  @override
  List<Object?> get props => [];
}

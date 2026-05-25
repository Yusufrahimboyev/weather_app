part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<WeatherModel> weatheModel;
  final Status status;

  const HomeState({required this.weatheModel, required this.status});

  HomeState copyWith({List<WeatherModel>? weatheModel, Status? status}) =>
      HomeState(
        weatheModel: weatheModel ?? this.weatheModel,
        status: status ?? this.status,
      );
  @override
  List<Object?> get props => <WeatherModel>[];
}

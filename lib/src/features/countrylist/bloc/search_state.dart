import 'package:equatable/equatable.dart';
import 'package:tsk_4/src/common/utils/status_enum.dart';

class SearchState extends Equatable {
  final Status status;
  final String? errorMessage;
  final List<String> cities;
  final String? cityName;
  const SearchState({
    this.status = Status.initial,
    this.errorMessage,
    this.cities = const <String>[],
    this.cityName,
  });

  SearchState copyWith({
    Status? status,
    String? errorMessage,
    List<String>? cities,
  }) => SearchState(
    status: status ?? this.status,
    errorMessage: errorMessage ?? this.errorMessage,
    cities: cities ?? this.cities,
  );

  @override
  List<Object?> get props => [status, errorMessage, cities];
}

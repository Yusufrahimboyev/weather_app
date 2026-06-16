import 'package:equatable/equatable.dart';
import 'package:tsk_4/src/common/utils/status_enum.dart';

class MainState extends Equatable {
  final Status status;
  final String photo;

  const MainState({this.status = Status.initial, required this.photo});

  MainState copyWith({Status? status, String? photo}) =>
      MainState(status: status ?? this.status, photo: photo ?? this.photo);

  @override
  List<Object?> get props => [status, photo];
}

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsk_4/src/common/model/weather_model.dart';
import 'package:tsk_4/src/common/utils/status_enum.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState(weatheModel: [], status: Status.initial)) {
    on<GetWeather$HomeEvent>(_getWeather);
  }

  Future<void> _getWeather(
    GetWeather$HomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      await Future.delayed(Duration(seconds: 1));
      emit(state.copyWith(status: Status.loaded));
    } catch (e) {
      emit(state.copyWith(status: Status.error));
    }
  }
}

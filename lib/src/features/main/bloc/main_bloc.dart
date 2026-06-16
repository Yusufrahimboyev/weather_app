import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tsk_4/src/common/constants/constants.dart';
import 'package:tsk_4/src/common/utils/status_enum.dart';
import 'package:tsk_4/src/features/main/bloc/main_event.dart';
import 'package:tsk_4/src/features/main/bloc/main_state.dart';
import 'package:tsk_4/src/features/main/data/photo_repository.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc(this._photoRepository, this.sharedPreferences)
    : super(
        MainState(
          photo: sharedPreferences.getString(Constants.background) ?? "",
        ),
      ) {
    on<MainEvent>(
      (event, emit) => switch (event) {
        GetPhoto$MainEvent() => _getPhoto(event, emit),
      },
    );
  }
  final IPhotoRepository _photoRepository;
  final SharedPreferences sharedPreferences;
  Future<void> _getPhoto(
    GetPhoto$MainEvent event,
    Emitter<MainState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final photo = await _photoRepository.getPhoto(event.city);
      final imageUrl = photo.imageUrl ?? '';
      if (imageUrl.isNotEmpty) {
        await sharedPreferences.setString(Constants.background, imageUrl);
      }
      emit(state.copyWith(status: Status.success, photo: imageUrl));
    } catch (e) {
      emit(state.copyWith(status: Status.error));
    }
  }
}

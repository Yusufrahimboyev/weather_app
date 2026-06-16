import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsk_4/src/common/utils/status_enum.dart';
import 'package:tsk_4/src/features/countrylist/bloc/search_event.dart';
import 'package:tsk_4/src/features/countrylist/bloc/search_state.dart';
import 'package:tsk_4/src/features/countrylist/data/search_repository.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository searchRepository;

  SearchBloc({required this.searchRepository}) : super(const SearchState()) {
    on<SearchEvent>(
      (event, emit) => switch (event) {
        SearchByCountryName$SearchEvent() => _search(event, emit),
      },
    );
  }

  Future<void> _search(
    SearchByCountryName$SearchEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final results = await searchRepository.search(
        event.countryName,
        event.allCities,
      );
      emit(state.copyWith(status: Status.success, cities: results));
    } catch (e) {
      emit(state.copyWith(status: Status.error, errorMessage: e.toString()));
    }
  }
}

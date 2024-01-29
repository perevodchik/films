import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:films/data/repository/films/i_films_repository.dart';
import 'package:films/domain/film_list_item.dart';

part '_search_films_event.dart';

part '_search_films_state.dart';

typedef Emit = Emitter<SearchFilmsState>;

class SearchFilmsBloc extends Bloc<SearchFilmsEvent, SearchFilmsState> {
  SearchFilmsBloc({
    required this.filmsRepository,
  }) : super(const _Idle()) {
    on<_Fetch>(_fetch);
  }

  final IFilmsRepository filmsRepository;

  Future<void> _fetch(_Fetch event, Emit emit) async {
    if (state.isLoading) {
      return;
    }

    emit(const _Loading());

    try {
      final films = await filmsRepository.fetch(event.query);

      emit(_Ready(films));
    } catch (error) {
      emit(_Error(error: error));
    }
  }
}

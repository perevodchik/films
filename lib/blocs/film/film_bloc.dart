import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:films/data/repository/films/i_films_repository.dart';
import 'package:films/domain/film_detailed_info.dart';

part '_film_event.dart';

part '_film_state.dart';

typedef Emit = Emitter<FilmState>;

class FilmBloc extends Bloc<FilmEvent, FilmState> {
  FilmBloc({
    required this.filmsRepository,
  }) : super(const _Loading()) {
    on<_Fetch>(_fetch);
  }

  final IFilmsRepository filmsRepository;

  Future<void> _fetch(_Fetch event, Emit emit) async {
    final film = await filmsRepository.byId(event.id);

    emit(_Ready(film));
  }
}

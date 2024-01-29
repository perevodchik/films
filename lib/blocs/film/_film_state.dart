part of 'film_bloc.dart';

extension SearchFilmsStateX on FilmState {
  bool get isLoading => this is _Loading;

  bool get isReady => this is _Ready;

  bool get isError => this is _Error;

  _Ready get asReady => this as _Ready;

  _Error get asError => this as _Error;
}

abstract class FilmState extends Equatable {
  const FilmState();

  @override
  List<Object?> get props => [];
}

class _Loading extends FilmState {
  const _Loading();
}

class _Ready extends FilmState {
  const _Ready(this.film);

  final FilmDetailedItem? film;

  @override
  List<Object?> get props => [film];
}

class _Error extends FilmState {
  const _Error({this.error});

  final Object? error;

  @override
  List<Object?> get props => [error];
}

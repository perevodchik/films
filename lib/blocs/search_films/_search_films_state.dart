part of 'search_films_bloc.dart';

extension SearchFilmsStateX on SearchFilmsState {
  bool get isLoading => this is _Loading;

  bool get isReady => this is _Ready;

  bool get isError => this is _Error;

  _Ready get asReady => this as _Ready;

  _Error get asError => this as _Error;
}

abstract class SearchFilmsState extends Equatable {
  const SearchFilmsState();

  @override
  List<Object?> get props => [];
}

class _Idle extends SearchFilmsState {
  const _Idle();
}

class _Loading extends SearchFilmsState {
  const _Loading();
}

class _Ready extends SearchFilmsState {
  const _Ready(this.films);

  final List<FilmListItem> films;

  @override
  List<Object?> get props => [films];
}

class _Error extends SearchFilmsState {
  const _Error({this.error});

  final Object? error;

  @override
  List<Object?> get props => [error];
}

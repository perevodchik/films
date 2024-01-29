part of 'search_films_bloc.dart';

extension SearchFilmsBlocX on SearchFilmsBloc {
  void fetch(String query) => add(_Fetch(query));
}

abstract class SearchFilmsEvent extends Equatable {
  const SearchFilmsEvent();

  @override
  List<Object?> get props => [];
}

class _Fetch extends SearchFilmsEvent {
  const _Fetch(this.query);

  final String query;

  @override
  List<Object?> get props => [query];
}

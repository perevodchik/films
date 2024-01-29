part of 'film_bloc.dart';

extension FilmBlocX on FilmBloc {
  void fetch(int id) => add(_Fetch(id));
}

abstract class FilmEvent extends Equatable {
  const FilmEvent();

  @override
  List<Object?> get props => [];
}

class _Fetch extends FilmEvent {
  const _Fetch(this.id);

  final int id;

  @override
  List<Object?> get props => [id];
}

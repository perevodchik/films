import 'package:equatable/equatable.dart';

class FilmListItem extends Equatable {
  const FilmListItem({
    required this.id,
    required this.name,
    required this.descriptions,
    required this.posterUrl,
  });

  final int id;
  final String name;
  final String descriptions;
  final String? posterUrl;

  @override
  List<Object?> get props => [id, name, descriptions, posterUrl];
}

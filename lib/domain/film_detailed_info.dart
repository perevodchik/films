import 'package:equatable/equatable.dart';

class FilmDetailedItem extends Equatable {
  const FilmDetailedItem({
    required this.name,
    required this.descriptions,
    required this.posterUrl,
    required this.rate,
  });

  final String name;
  final String descriptions;
  final String? posterUrl;
  final double rate;

  @override
  List<Object?> get props => [name, descriptions, posterUrl, rate];
}

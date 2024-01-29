import 'package:films/data/data_sources/local/films/models/film_database_entity.dart';
import 'package:films/domain/film_list_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'film_response_entity.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class FilmResponseEntity {
  const FilmResponseEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.voteAverage,
    this.posterPath,
  });

  factory FilmResponseEntity.fromJson(Map<String, dynamic> json) {
    return _$FilmResponseEntityFromJson(json);
  }

  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final double voteAverage;
}

extension FilmResponseEntityX on FilmResponseEntity {
  FilmListItem toListItem() {
    return FilmListItem(
      id: id,
      name: title,
      descriptions: overview,
      posterUrl: posterPath == null
          ? null
          : 'https://image.tmdb.org/t/p/w500/$posterPath',
    );
  }

  FilmDatabaseEntity toDatabaseEntity() {
    return FilmDatabaseEntity(
      id: id,
      name: title,
      description: overview,
      rate: voteAverage,
      posterUrl: posterPath == null
          ? null
          : 'https://image.tmdb.org/t/p/w500/$posterPath',
    );
  }
}

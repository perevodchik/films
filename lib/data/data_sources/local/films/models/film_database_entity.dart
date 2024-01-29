import 'package:films/domain/film_detailed_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'film_database_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FilmDatabaseEntity {
  const FilmDatabaseEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.rate,
    this.posterUrl,
  });

  factory FilmDatabaseEntity.fromJson(Map<String, dynamic> json) {
    return _$FilmDatabaseEntityFromJson(json);
  }

  final int id;
  final String name;
  final String description;
  final double rate;
  final String? posterUrl;

  Map<String, dynamic> toJson() => _$FilmDatabaseEntityToJson(this);
}

extension FilmDatabaseEntityX on FilmDatabaseEntity {
  FilmDetailedItem toDomain() {
    return FilmDetailedItem(
      posterUrl: posterUrl,
      descriptions: description,
      name: name,
      rate: rate,
    );
  }
}

import 'package:films/data/data_sources/network/models/film_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fetch_films_response.g.dart';

@JsonSerializable(createToJson: false)
class FetchFilmsResponse {
  const FetchFilmsResponse({required this.page, required this.results});

  factory FetchFilmsResponse.fromJson(Map<String, dynamic> json) {
    return _$FetchFilmsResponseFromJson(json);
  }

  final int page;
  final List<FilmResponseEntity> results;
}

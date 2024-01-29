// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmResponseEntity _$FilmResponseEntityFromJson(Map<String, dynamic> json) =>
    FilmResponseEntity(
      id: json['id'] as int,
      title: json['title'] as String,
      overview: json['overview'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      posterPath: json['poster_path'] as String?,
    );

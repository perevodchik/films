// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_films_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchFilmsResponse _$FetchFilmsResponseFromJson(Map<String, dynamic> json) =>
    FetchFilmsResponse(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => FilmResponseEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

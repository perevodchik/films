// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_database_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmDatabaseEntity _$FilmDatabaseEntityFromJson(Map<String, dynamic> json) =>
    FilmDatabaseEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      rate: (json['rate'] as num).toDouble(),
      posterUrl: json['poster_url'] as String?,
    );

Map<String, dynamic> _$FilmDatabaseEntityToJson(FilmDatabaseEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'rate': instance.rate,
      'poster_url': instance.posterUrl,
    };

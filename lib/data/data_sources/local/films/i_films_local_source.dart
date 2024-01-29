import 'package:films/data/data_sources/local/films/models/film_database_entity.dart';
import 'package:films/data/data_sources/network/models/film_response_entity.dart';

abstract class IFilmsLocalSource {
  const IFilmsLocalSource();

  Future<FilmDatabaseEntity?> byId(int id);

  Future<void> save(List<FilmResponseEntity> source);
}

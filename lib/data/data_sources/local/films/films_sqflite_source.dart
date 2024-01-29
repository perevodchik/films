import 'package:films/data/data_sources/local/films/i_films_local_source.dart';
import 'package:films/data/data_sources/local/films/models/film_database_entity.dart';
import 'package:films/data/data_sources/local/films_db.dart';
import 'package:films/data/data_sources/network/models/film_response_entity.dart';
import 'package:sqflite/sqflite.dart';

class FilmsSqfliteSource extends IFilmsLocalSource {
  const FilmsSqfliteSource({required this.filmsDb});

  final FilmsDb filmsDb;

  @override
  Future<FilmDatabaseEntity?> byId(int id) async {
    final db = await filmsDb.open();

    final result = await db.rawQuery('SELECT * from FILMS where id = ?', [id]);

    if (result.isEmpty) {
      return null;
    }

    return FilmDatabaseEntity.fromJson(result.first);
  }

  @override
  Future<void> save(List<FilmResponseEntity> source) async {
    final db = await filmsDb.open();

    final databaseEntities = source.map((e) => e.toDatabaseEntity()).toList();

    await db.transaction((txn) async {
      for (final item in databaseEntities) {
        await txn.insert(
          'films',
          item.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    });
  }
}

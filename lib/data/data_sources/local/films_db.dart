import 'package:sqflite/sqflite.dart';

class FilmsDb {
  FilmsDb() {
    open();
  }

  Database? _database;

  Future<Database> open() async {
    if (_database != null) {
      return _database!;
    }

    const path = 'films.db';
    _database = await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
    );

    return _database!;
  }

  Future<void> _onCreate(Database database, int version) async {
    const createFilmsQuery =
        'CREATE TABLE films (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, description TEXT NOT NULL, poster_url TEXT, rate REAL NOT NULL)';

    await database.execute(createFilmsQuery);
  }
}

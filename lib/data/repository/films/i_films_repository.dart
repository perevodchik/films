import 'package:films/domain/film_detailed_info.dart';
import 'package:films/domain/film_list_item.dart';

abstract class IFilmsRepository {
  const IFilmsRepository();

  Future<List<FilmListItem>> fetch(String query);

  Future<FilmDetailedItem?> byId(int id);
}

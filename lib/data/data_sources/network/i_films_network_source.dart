import 'package:films/data/data_sources/network/response/fetch_films_response.dart';
import 'package:films/domain/film_list_item.dart';

abstract class IFilmsNetworkSource {
  const IFilmsNetworkSource();

  Future<FetchFilmsResponse> fetch(String query);

  Future<FilmListItem?> byId(int id);
}

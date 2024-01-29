import 'package:films/data/data_sources/local/films/i_films_local_source.dart';
import 'package:films/data/data_sources/local/films/models/film_database_entity.dart';
import 'package:films/data/data_sources/network/i_films_network_source.dart';
import 'package:films/data/data_sources/network/models/film_response_entity.dart';
import 'package:films/data/repository/films/i_films_repository.dart';
import 'package:films/domain/film_detailed_info.dart';
import 'package:films/domain/film_list_item.dart';

class FilmsRepository extends IFilmsRepository {
  const FilmsRepository({
    required this.filmsNetworkSource,
    required this.filmsLocalSource,
  });

  final IFilmsNetworkSource filmsNetworkSource;
  final IFilmsLocalSource filmsLocalSource;

  @override
  Future<FilmDetailedItem?> byId(int id) async {
    final response = await filmsLocalSource.byId(id);

    return response?.toDomain();
  }

  @override
  Future<List<FilmListItem>> fetch(String query) async {
    final response = await filmsNetworkSource.fetch(query);

    await filmsLocalSource.save(response.results);

    return response.results.map((entity) => entity.toListItem()).toList();
  }
}

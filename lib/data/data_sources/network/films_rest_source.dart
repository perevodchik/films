import 'package:films/data/data_sources/network/i_films_network_source.dart';
import 'package:films/data/data_sources/network/response/fetch_films_response.dart';
import 'package:films/data/data_sources/network/themoviesdb_rest_client.dart';
import 'package:films/domain/film_list_item.dart';

class FilmsRestSource extends IFilmsNetworkSource {
  const FilmsRestSource({
    required this.restClient,
  });

  final TheMoviesDbRestClient restClient;

  @override
  Future<FilmListItem?> byId(int id) async {
    return null;
  }

  @override
  Future<FetchFilmsResponse> fetch(String query) async {
    final response = await restClient.fetch(
      apiKey: 'c7ac8c58e1de3091352ce23cd7ab835d',
      query: query,
    );

    return response.data;
  }
}

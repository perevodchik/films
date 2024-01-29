import 'package:dio/dio.dart';
import 'package:films/data/data_sources/network/response/fetch_films_response.dart';
import 'package:retrofit/retrofit.dart';

part 'themoviesdb_rest_client.g.dart';

typedef FR<T> = Future<HttpResponse<T>>;

@RestApi(baseUrl: 'https://api.themoviedb.org/3')
abstract class TheMoviesDbRestClient {
  factory TheMoviesDbRestClient(Dio dio) = _TheMoviesDbRestClient;

  @GET('/search/movie')
  FR<FetchFilmsResponse> fetch({
    @Query('api_key') required String apiKey,
    @Query('query') required String query,
  });
}

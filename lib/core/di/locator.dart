import 'package:dio/dio.dart';
import 'package:films/blocs/deeplinks/deeplinks_cubit.dart';
import 'package:films/blocs/film/film_bloc.dart';
import 'package:films/blocs/search_films/search_films_bloc.dart';
import 'package:films/data/data_sources/local/films/films_sqflite_source.dart';
import 'package:films/data/data_sources/local/films/i_films_local_source.dart';
import 'package:films/data/data_sources/local/films_db.dart';
import 'package:films/data/data_sources/network/films_rest_source.dart';
import 'package:films/data/data_sources/network/i_films_network_source.dart';
import 'package:films/data/data_sources/network/themoviesdb_rest_client.dart';
import 'package:films/data/repository/films/films_repository.dart';
import 'package:films/data/repository/films/i_films_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final locator = GetIt.instance;

void setupServiceLocator() {
  locator
    ..registerLazySingleton(() {
      return FilmsDb();
    })
    ..registerLazySingleton<TheMoviesDbRestClient>(() {
      final dio = Dio()
        ..interceptors.add(
          PrettyDioLogger(requestHeader: true, requestBody: true),
        );

      return TheMoviesDbRestClient(dio);
    })
    ..registerFactory<IFilmsLocalSource>(() {
      return FilmsSqfliteSource(
        filmsDb: locator(),
      );
    })
    ..registerFactory<IFilmsNetworkSource>(() {
      return FilmsRestSource(restClient: locator());
    })
    ..registerFactory<IFilmsRepository>(() {
      return FilmsRepository(
        filmsNetworkSource: locator(),
        filmsLocalSource: locator(),
      );
    })
    ..registerFactory(() {
      return DeepLinksCubit();
    })
    ..registerFactory(() {
      return SearchFilmsBloc(filmsRepository: locator());
    })
    ..registerFactory(() {
      return FilmBloc(filmsRepository: locator());
    });
}

extension GetItX on GetIt {
  T getImpl<T extends Object, I extends T>() {
    final instanceName = '$I';

    return get<T>(instanceName: instanceName);
  }

  void setImpl<T extends Object, I extends T>(
    FactoryFunc<I> factoryFunc, {
    bool asSingleton = false,
    bool asLazySingleton = false,
  }) {
    final instanceName = '$I';

    if (!asSingleton) {
      return registerFactory<T>(factoryFunc, instanceName: instanceName);
    }

    if (asLazySingleton) {
      return registerLazySingleton<T>(
        () => factoryFunc(),
        instanceName: instanceName,
      );
    }

    registerSingleton<T>(factoryFunc(), instanceName: instanceName);
  }
}

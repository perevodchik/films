import 'package:films/presentation/router/routes.dart';
import 'package:films/presentation/views/film/film_screen.dart';
import 'package:films/presentation/views/home/home_screen.dart';
import 'package:films/presentation/views/shared/setup/deeplinks_setup.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();

GoRouter getRouter() {
  return GoRouter(
    navigatorKey: navigatorKey,
    routes: [
      ShellRoute(
        builder: (_, __, child) {
          return DeepLinksSetup(child: child);
        },
        routes: [
          GoRoute(
            path: Routes.initial.goRoute,
            builder: (_, __) => const HomeScreen(),
          ),
          GoRoute(
            path: Routes.film.goRoute,
            builder: (_, state) {
              final param = Routes.film.paramName;
              final id = int.parse(state.pathParameters[param] ?? '0');

              return FilmScreen(id: id);
            },
          )
        ],
      ),
    ],
  );
}

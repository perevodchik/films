import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppNavigatorObserver extends NavigatorObserver {
  String get id => '$runtimeType';

  void go(GoRouterState state, GoRouterState? previousState) {}

  void goNamed(GoRouterState state, GoRouterState? previousState) {}

  void pop(GoRouterState from, GoRouterState to) {}

  void push(GoRouterState state, GoRouterState? previousState) {}

  void pushNamed(GoRouterState state, GoRouterState? previousState) {}

  void refresh(GoRouterState state) {}

  void replace(GoRouterState state, GoRouterState? previousState) {}

  void replaceNamed(GoRouterState state, GoRouterState? previousState) {}
}

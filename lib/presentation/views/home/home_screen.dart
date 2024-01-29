import 'package:films/blocs/search_films/search_films_bloc.dart';
import 'package:films/core/di/locator.dart';
import 'package:films/presentation/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<HomeScreen> {
  late final SearchFilmsBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = locator.get();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _bloc,
      child: const Scaffold(
        body: SafeArea(
          bottom: false,
          child: HomeView(),
        ),
      ),
    );
  }
}

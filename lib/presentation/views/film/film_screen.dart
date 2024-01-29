import 'package:films/blocs/film/film_bloc.dart';
import 'package:films/core/di/locator.dart';
import 'package:films/presentation/views/film/film_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilmScreen extends StatefulWidget {
  const FilmScreen({
    required this.id,
    super.key,
  });

  final int id;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<FilmScreen> {
  late final FilmBloc _filmBloc;

  @override
  void initState() {
    super.initState();

    _filmBloc = locator()..fetch(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _filmBloc,
      child: Scaffold(
        appBar: AppBar(),
        body: const SafeArea(
          bottom: false,
          child: FilmView(),
        ),
      ),
    );
  }
}

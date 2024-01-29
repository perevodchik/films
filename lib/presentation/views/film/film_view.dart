import 'package:cached_network_image/cached_network_image.dart';
import 'package:films/blocs/film/film_bloc.dart';
import 'package:films/presentation/views/shared/empty_result_message.dart';
import 'package:films/presentation/views/shared/error_message.dart';
import 'package:films/presentation/views/shared/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilmView extends StatelessWidget {
  const FilmView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilmBloc, FilmState>(
      builder: (_, state) {
        if (state.isLoading) {
          return const LoadingIndicator();
        }

        if (state.isError) {
          return ErrorMessage(error: state.asError.error);
        }

        final film = state.asReady.film;
        if (film == null) {
          return const EmptyResultMessage();
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: film.posterUrl ?? '',
                errorWidget: (_, __, ___) {
                  return const Placeholder();
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      film.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${film.rate.toStringAsFixed(1)}/10',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SelectableText(
                      film.descriptions,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        );
      },
    );
  }
}

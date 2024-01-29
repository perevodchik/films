import 'package:films/blocs/search_films/search_films_bloc.dart';
import 'package:films/core/utils/debounce.dart';
import 'package:films/domain/film_list_item.dart';
import 'package:films/presentation/router/routes.dart';
import 'package:films/presentation/views/shared/empty_result_message.dart';
import 'package:films/presentation/views/shared/error_message.dart';
import 'package:films/presentation/views/shared/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'components/_films_list.dart';

part 'components/_films_table_cell_text.dart';

part 'components/_search_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SearchField(
          onQueryChanged: (query) => _onQueryChanged(context, query),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: BlocBuilder<SearchFilmsBloc, SearchFilmsState>(
            builder: (_, state) {
              if (state.isLoading) {
                return const LoadingIndicator();
              }
              if (state.isError) {
                return ErrorMessage(error: state.asError.error);
              }

              if (!state.isReady) {
                return const SizedBox.shrink();
              }

              return _FilmsList(state.asReady.films);
            },
          ),
        ),
      ],
    );
  }

  void _onQueryChanged(BuildContext context, String query) {
    context.read<SearchFilmsBloc>().fetch(query);
  }
}

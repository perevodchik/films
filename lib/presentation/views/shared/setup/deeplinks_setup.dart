import 'package:films/blocs/deeplinks/deeplinks_cubit.dart';
import 'package:films/core/di/locator.dart';
import 'package:films/presentation/router/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DeepLinksSetup extends StatefulWidget {
  const DeepLinksSetup({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<DeepLinksSetup> {
  late final DeepLinksCubit _deepLinksCubit;

  @override
  void initState() {
    super.initState();

    _deepLinksCubit = locator();
  }

  @override
  void dispose() {
    _deepLinksCubit.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeepLinksCubit, DeepLinksState>(
      bloc: _deepLinksCubit,
      listener: (_, state) {
        if (state.isReady) {
          _performLink(state.asReady.deepLink);
        }
      },
      child: widget.child,
    );
  }

  void _performLink(Uri link) {
    if (link.path.contains('film')) {
      final id = int.parse(link.queryParameters['id'] ?? '0');

      context.push(Routes.film.path(args: ['$id']));
    }
  }
}

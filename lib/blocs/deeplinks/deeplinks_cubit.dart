import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_links/uni_links.dart';

part '_deeplinks_state.dart';

class DeepLinksCubit extends Cubit<DeepLinksState> {
  DeepLinksCubit() : super(const _Idle()) {
    _startListen();
  }

  late final StreamSubscription<String?> _linksStream;

  @override
  Future<void> close() {
    _linksStream.cancel();

    return super.close();
  }

  void _startListen() {
    _initDeepLinkState();
  }

  Future<void> _initDeepLinkState() async {
    try {
      final initialLink = await getInitialLink();

      _handleLink(initialLink);
    } on PlatformException {}

    await _listenForDeepLinks();
  }

  Future<void> _listenForDeepLinks() async {
    try {
      _linksStream = linkStream.listen(_handleLink);
    } on PlatformException {}
  }

  void _handleLink(String? link) {
    if (link?.isEmpty ?? true) {
      return;
    }

    final uri = Uri.parse(link!);

    emit(_Ready(uri));
    emit(const _Idle());
  }
}

part of 'routes.dart';

class _Path extends Equatable {
  const _Path(
    this.name, {
    this.parent,
  });

  final String name;

  final _Path? parent;

  String get goRoute {
    if (isRoot) {
      return '/$name';
    }

    return name;
  }

  String get raw {
    return name;
  }

  String get rawPath {
    if (parent == null) {
      return '/$raw';
    }

    return [parent!.rawPath, raw].join('/');
  }

  String path({
    List<String> args = const [],
    Map<String, dynamic> queryParams = const {},
  }) {
    final segments = rawPath.split('/')
      ..removeWhere(
        (element) => element.isEmpty,
      );

    for (var i = 0; i < segments.length; i++) {
      if (segments[i].startsWith(':')) {
        segments[i] = args.removeAt(0);
      }
    }

    final path = segments.join('/');
    if (path.isEmpty) {
      return '/';
    }

    if (queryParams.isEmpty) {
      if (path.startsWith('/')) {
        return path;
      }

      return '/$path';
    }

    final params = queryParams.entries.map((e) {
      return '${e.key}=${e.value}';
    }).join('&');

    if (path.startsWith('/')) {
      return '$path?$params';
    }

    return '/$path?$params';
  }

  bool get isRoot {
    return parent == null || name.isEmpty;
  }

  @override
  List<Object?> get props => [name, parent, isRoot];
}

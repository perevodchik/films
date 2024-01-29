part of 'routes.dart';

class _PathWithParam extends _Path {
  const _PathWithParam({
    required this.paramName,
    required String name,
    _Path? parent,
  }) : super(name, parent: parent);

  final String paramName;

  @override
  String get raw {
    return [name, ':$paramName'].join('/');
  }

  @override
  String get goRoute {
    if (isRoot) {
      return '/$name/:$paramName';
    }

    return '$name/:$paramName';
  }

  @override
  List<Object?> get props => [...super.props, paramName];
}

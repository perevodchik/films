import 'package:equatable/equatable.dart';

part '_path.dart';

part '_path_with_param.dart';

class Routes {
  Routes._();

  static const initial = _Path('');
  static const film = _PathWithParam(name: 'splash', paramName: 'id');
}

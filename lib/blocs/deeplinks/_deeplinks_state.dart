part of 'deeplinks_cubit.dart';

extension DeepLinksStateX on DeepLinksState {
  bool get isReady => this is _Ready;

  _Ready get asReady => this as _Ready;
}

abstract class DeepLinksState extends Equatable {
  const DeepLinksState();

  @override
  List<Object?> get props => [];
}

class _Idle extends DeepLinksState {
  const _Idle();
}

class _Ready extends DeepLinksState {
  const _Ready(this.deepLink);

  final Uri deepLink;
}

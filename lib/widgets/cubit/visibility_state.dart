part of 'visibility_cubit.dart';

abstract class VisibilityState extends Equatable {
  const VisibilityState({required this.hide});
  final bool hide;

  @override
  List<Object> get props => [hide];
}

class VisibilityInitial extends VisibilityState {
  const VisibilityInitial({super.hide = true});

  @override
  List<Object> get props => [hide];
}

class VisibilityChanged extends VisibilityState {
  const VisibilityChanged({required super.hide});

  @override
  List<Object> get props => [hide];
}

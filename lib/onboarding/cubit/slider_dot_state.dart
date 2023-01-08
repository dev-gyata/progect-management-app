part of 'slider_dot_cubit.dart';

@immutable
abstract class SliderDotState extends Equatable {
  SliderDotState({required this.index});

  final int index;

  @override
  List<Object?> get props => [index];
}

class SliderDotInitial extends SliderDotState {
  SliderDotInitial({required super.index});
}

class SliderDotChanged extends SliderDotState {
  SliderDotChanged({required super.index});
}

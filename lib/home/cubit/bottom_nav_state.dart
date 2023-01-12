part of 'bottom_nav_cubit.dart';

abstract class BottomNavState extends Equatable {
  const BottomNavState(this.index);
  final int index;

  @override
  List<Object> get props => [index];
}

class BottomNavInitial extends BottomNavState {
  const BottomNavInitial() : super(0);
}

class BottomNavChanged extends BottomNavState {
  const BottomNavChanged(super.index);
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'visibility_state.dart';

class VisibilityCubit extends Cubit<VisibilityState> {
  VisibilityCubit() : super(const VisibilityInitial());

  set onVisibilityChanged(bool value) => emit(VisibilityChanged(hide: value));
}

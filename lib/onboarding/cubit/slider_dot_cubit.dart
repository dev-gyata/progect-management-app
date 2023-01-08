import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'slider_dot_state.dart';

class SliderDotCubit extends Cubit<SliderDotState> {
  SliderDotCubit() : super(SliderDotInitial(index: 0));

  set onChanged(int index) => emit(SliderDotChanged(index: index));
}

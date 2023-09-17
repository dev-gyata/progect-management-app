import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:progect_management_app/auth/login/model/models.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required AuthenticationRepository repository})
      : _authenticationRepository = repository,
        super(const LoginState());

  final AuthenticationRepository _authenticationRepository;
  void onEmailChanged(String value) {
    final email = Email.dirty(value);

    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([
          email,
          state.password,
        ]),
      ),
    );
  }

  void onPasswordChanged(String value) {
    final password = Password.dirty(value);

    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([
          password,
          state.email,
        ]),
      ),
    );
  }

  Future<void> onSumbit() async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final response = await _authenticationRepository.login(
          email: state.email.value, password: state.password.value);
      if (response.$2 != null) {
        emit(state.copyWith(
            errorMessage: response.$2, status: FormzSubmissionStatus.failure));
        return;
      }
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    }
  }
}

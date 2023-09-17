part of 'login_cubit.dart';

final class LoginState extends Equatable {
  const LoginState(
      {this.status = FormzSubmissionStatus.initial,
      this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.isValid = false,
      this.errorMessage});

  final FormzSubmissionStatus status;
  final Email email;
  final Password password;
  final bool isValid;
  final String? errorMessage;

  LoginState copyWith({
    FormzSubmissionStatus? status,
    Email? email,
    Password? password,
    bool? isValid,
    String? errorMessage,
  }) {
    return LoginState(
        status: status ?? this.status,
        email: email ?? this.email,
        password: password ?? this.password,
        isValid: isValid ?? this.isValid,
        errorMessage: errorMessage);
  }

  @override
  List<Object> get props => [status, email, password, isValid];
}

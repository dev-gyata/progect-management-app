import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  const LoginModel(this.email, this.password);

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];

  LoginModel copyWith({
    String? email,
    String? password,
  }) {
    return LoginModel(
      email ?? this.email,
      password ?? this.password,
    );
  }
}

import 'package:equatable/equatable.dart';

class CreateAccountModel extends Equatable {
  const CreateAccountModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String password;

  CreateAccountModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
  }) {
    return CreateAccountModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [firstName, lastName, email, password];
}

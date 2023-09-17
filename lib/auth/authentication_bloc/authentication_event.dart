part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object?> get props => [];
}

final class AuthenticationStatusChanged extends AuthenticationEvent {
  const AuthenticationStatusChanged(this.user);

  final User? user;

  @override
  List<Object?> get props => [user];
}

final class AuthenticationLogoutRequested extends AuthenticationEvent {}

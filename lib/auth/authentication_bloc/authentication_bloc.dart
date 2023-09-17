import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
      {required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(const AuthenticationState.unknown()) {
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);

    _subscription = FirebaseAuth.instance.authStateChanges().listen((event) {
      add(AuthenticationStatusChanged(event));
    });
  }

  final AuthenticationRepository _authenticationRepository;

  late StreamSubscription<User?>? _subscription;

  Future<void> _onAuthenticationStatusChanged(
    AuthenticationStatusChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    if (event.user != null) {
      return emit(AuthenticationState.authenticated(event.user!));
    }
    emit(const AuthenticationState.unauthenticated());
  }

  FutureOr<void> _onAuthenticationLogoutRequested(
      AuthenticationLogoutRequested event, Emitter<AuthenticationState> emit) {
    emit(const AuthenticationState.unauthenticated());
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}

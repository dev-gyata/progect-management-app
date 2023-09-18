import 'dart:async';

import 'package:authentication_repository/src/service/auth_service.dart';
import 'package:authentication_repository/src/typedefs/api_reponse.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository {
  AuthenticationRepository({required AuthenticationService service})
      : _service = service;

  final AuthenticationService _service;

  Stream<User?> get getUser {
    return FirebaseAuth.instance.authStateChanges();
  }

  Future<ApiResponse<void>> login({
    required String email,
    required String password,
  }) async {
    final response = await _service.login(email: email, password: password);
    if (response is String) {
      return (null, response);
    }
    return (null, null);
  }

  Future<ApiResponse<void>> logout() async {
    final response = await _service.logout();
    if (response is String) {
      return (null, response);
    }
    return (null, null);
  }
}

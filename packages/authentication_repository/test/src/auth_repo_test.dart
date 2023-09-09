import 'package:authentication_repository/src/auth_repo.dart';
import 'package:authentication_repository/src/service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'helpers/mocks.dart';

void main() {
  group('Authentication Repository class Method test ------- ', () {
    late AuthenticationRepository authenticationRepository;
    late AuthenticationService authenticationService;
    const rightCredentials = (email: 'email@email.com', password: 'password');
    const wrongCredentials =
        (email: 'wrong@email.com', password: 'badpassword');
    const responseForSuccessfullLogin = (null, null);
    const responseForUnSuccessfullLogin = (null, 'Invalid credentials');
    setUpAll(() {
      authenticationService = AuthenticationServiceMock();
      authenticationRepository =
          AuthenticationRepository(service: authenticationService);
    });

    test('test for successfull login with right credentials', () async {
      when(() => authenticationService.login(
              email: rightCredentials.email,
              password: rightCredentials.password))
          .thenAnswer((invocation) async => null);
      final response = await authenticationRepository.login(
          email: rightCredentials.email, password: rightCredentials.password);
      expect(response, responseForSuccessfullLogin);

      verify(() => authenticationService.login(
          email: rightCredentials.email,
          password: rightCredentials.password)).called(1);
    });
    test('test for unsuccessfull login with wrong credentials', () async {
      when(() => authenticationService.login(
              email: wrongCredentials.email,
              password: wrongCredentials.password))
          .thenAnswer((invocation) async => responseForUnSuccessfullLogin.$2);
      final response = await authenticationRepository.login(
          email: wrongCredentials.email, password: wrongCredentials.password);
      expect(response, responseForUnSuccessfullLogin);

      verify(() => authenticationService.login(
          email: wrongCredentials.email,
          password: wrongCredentials.password)).called(1);
    });
  });
}

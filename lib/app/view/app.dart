import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progect_management_app/auth/authentication_bloc/authentication_bloc.dart';
import 'package:progect_management_app/auth/login/view/login_page.dart';
import 'package:progect_management_app/home/view/home_page.dart';
import 'package:progect_management_app/l10n/l10n.dart';
import 'package:progect_management_app/onboarding/view/onboarding_page.dart';
import 'package:progect_management_app/splash/view/splash.dart';
import 'package:progect_management_app/theme/theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) =>
          AuthenticationRepository(service: AuthenticationService()),
      child: BlocProvider(
        create: (context) => AuthenticationBloc(
            authenticationRepository: context.read<AuthenticationRepository>()),
        child: MaterialApp(
          navigatorKey: _navigatorKey,
          theme: AppTheme.lightTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          builder: (context, child) {
            return BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                switch (state.status) {
                  case AuthenticationStatus.authenticated:
                    _navigator.pushAndRemoveUntil<void>(
                      MaterialPageRoute(builder: (_) => HomePage()),
                      (route) => false,
                    );
                  case AuthenticationStatus.unauthenticated:
                    _navigator.pushAndRemoveUntil<void>(
                      MaterialPageRoute(builder: (_) => LoginPage()),
                      (route) => false,
                    );
                    ;
                  case AuthenticationStatus.unknown:
                    '';
                }
                ;
              },
              child: child,
            );
          },
          onGenerateRoute: (_) =>
              MaterialPageRoute(builder: (_) => const SplashPage()),
        ),
      ),
    );
  }
}

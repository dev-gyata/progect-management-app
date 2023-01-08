import 'package:flutter/material.dart';
import 'package:progect_management_app/l10n/l10n.dart';
import 'package:progect_management_app/onboarding/view/onboarding_page.dart';
import 'package:progect_management_app/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const OnboardingPage(),
    );
  }
}

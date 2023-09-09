import 'package:flutter_test/flutter_test.dart';
import 'package:progect_management_app/onboarding/view/onboarding_page.dart';

import '../../helpers/helpers.dart';

void main() {
  testWidgets('Renders onboarding page', (tester) async {
    await tester.pumpApp(const OnboardingPage());
    expect(find.byType(OnboardingPage), findsOneWidget);
  });
}

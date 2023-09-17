import 'package:flutter/widgets.dart';

class UnfocusWidget extends StatelessWidget {
  const UnfocusWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: child,
    );
  }
}

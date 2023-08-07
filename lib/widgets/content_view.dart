import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ContentView extends StatelessWidget {
  const ContentView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ResponsiveBreakpoints.of(context).isMobile
          ? const EdgeInsets.all(16)
          : const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      child: child,
    );
  }
}

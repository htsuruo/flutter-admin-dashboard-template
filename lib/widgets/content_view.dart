import 'package:flutter/material.dart';

class ContentView extends StatelessWidget {
  const ContentView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      child: child,
    );
  }
}

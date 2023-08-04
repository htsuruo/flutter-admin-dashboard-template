import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterLocationLabel extends StatelessWidget {
  const RouterLocationLabel({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final location = GoRouterState.of(context).uri.toString();
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Text(
          location,
          style: theme.textTheme.bodyLarge!.copyWith(
            color: colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}

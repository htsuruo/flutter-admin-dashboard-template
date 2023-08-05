import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router.dart';

class NavigationTitle extends StatelessWidget {
  const NavigationTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.go(routerInitialLocation),
        child: Text(
          'Flutter Admin Dashboard',
          style: theme.textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

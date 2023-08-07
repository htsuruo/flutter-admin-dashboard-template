import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class UserNotFoundPage extends StatelessWidget {
  const UserNotFoundPage({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toFilePath();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Page not found: $location',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Gap(8),
            Text('[$userId] is not found'),
          ],
        ),
      ),
    );
  }
}

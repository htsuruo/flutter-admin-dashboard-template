import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'navigation_title.dart';

class NavigationAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NavigationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const NavigationTitle(),
      centerTitle: false,
      elevation: 4,
      actions: [
        const Text('anonymous'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: PopupMenuButton<void>(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: const Text('Sign out'),
                onTap: () {
                  // Sign out logic
                },
              ),
            ],
            child: const Icon(Icons.account_circle_outlined),
          ),
        ),
        const Gap(8),
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}

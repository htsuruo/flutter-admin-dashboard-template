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
      elevation: 1,
      actions: [
        const Gap(8),
        const Text('htsuruo'),
        IconButton(
          icon: const Icon(Icons.account_circle_outlined),
          onPressed: () {
            // TODO(tsuruoka): なにかしらのアクション
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}

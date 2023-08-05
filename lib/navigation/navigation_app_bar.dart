import 'package:flutter/material.dart';

import 'navigation_title.dart';
import 'theme_mode_icon_button.dart';

class NavigationAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NavigationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const NavigationTitle(),
      centerTitle: false,
      elevation: 1,
      actions: [
        const ThemeModeIconButton(),
        IconButton(
          icon: const Icon(Icons.settings),
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

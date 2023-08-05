import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class ThemeModeIconButton extends StatelessWidget {
  const ThemeModeIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final (iconData, action) = switch (brightness) {
      Brightness.light => (
          Icons.dark_mode,
          AdaptiveTheme.of(context).setDark,
        ),
      Brightness.dark => (
          Icons.light_mode,
          AdaptiveTheme.of(context).setLight,
        )
    };
    return IconButton(
      icon: Icon(iconData),
      onPressed: action,
    );
  }
}

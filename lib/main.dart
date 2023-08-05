import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard_template/theme.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'router.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppTheme.light,
      dark: AppTheme.dark,
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp.router(
        title: 'Flutter Admin Dashboard',
        routerConfig: router,
        theme: theme,
        darkTheme: darkTheme,
      ),
    );
  }
}

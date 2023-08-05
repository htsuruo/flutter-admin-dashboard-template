import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard_template/theme.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'router.dart';

void main() {
  usePathUrlStrategy();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  static const title = 'Flutter Admin Dashboard';

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppTheme.light,
      dark: AppTheme.dark,
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp.router(
        title: title,
        routerConfig: router,
        theme: theme,
        darkTheme: darkTheme,
      ),
    );
  }
}

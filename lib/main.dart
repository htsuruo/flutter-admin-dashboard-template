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
    return MaterialApp.router(
      title: 'Flutter Admin Dashboard',
      routerConfig: router,
      themeMode: ThemeMode.dark,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
    );
  }
}

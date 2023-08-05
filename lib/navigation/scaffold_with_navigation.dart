import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard_template/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

import 'navigation_item.dart';
import 'navigation_title.dart';

class ScaffoldWithNavigation extends StatelessWidget {
  const ScaffoldWithNavigation({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        switch (constraints.maxWidth) {
          case < 450:
            return _ScaffoldWithNavigationBar(navigationShell);
          default:
            return _ScaffoldWithNavigationRail(navigationShell);
        }
      },
    );
  }
}

class _ScaffoldWithNavigationRail extends StatelessWidget {
  const _ScaffoldWithNavigationRail(this.navigationShell);

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Row(
        children: [
          NavigationRail(
            // extended: true,
            selectedIndex: navigationShell.currentIndex,
            unselectedLabelTextStyle: theme.textTheme.bodyMedium,
            selectedLabelTextStyle: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
            onDestinationSelected: (index) {
              navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              );
            },
            destinations: [
              for (final item in NavigationItem.values)
                NavigationRailDestination(
                  icon: Icon(item.iconData),
                  label: Text(item.label),
                ),
            ],
          ),
          VerticalDivider(
            thickness: 1,
            width: 1,
            color: colorScheme.primary.withOpacity(0.2),
          ),
          Expanded(child: navigationShell),
        ],
      ),
    );
  }
}

class _ScaffoldWithNavigationBar extends StatelessWidget {
  const _ScaffoldWithNavigationBar(this.navigationShell);

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        destinations: [
          for (final item in NavigationItem.values)
            NavigationDestination(
              icon: Icon(item.iconData),
              label: item.label,
            ),
        ],
      ),
    );
  }
}

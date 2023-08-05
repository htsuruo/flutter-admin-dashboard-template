import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard_template/main.dart';
import 'package:go_router/go_router.dart';

import 'navigation_app_bar.dart';
import 'navigation_item.dart';

class ScaffoldWithNavigation extends StatelessWidget {
  const ScaffoldWithNavigation({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          switch (constraints.maxWidth) {
            case < 450:
              return _ScaffoldWithDrawer(navigationShell);
            default:
              return _ScaffoldWithNavigationRail(navigationShell);
          }
        },
      ),
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
      appBar: const NavigationAppBar(),
      body: Row(
        children: [
          _NavigationRail(
            navigationShell: navigationShell,
            expand: false,
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

class _ScaffoldWithDrawer extends StatelessWidget {
  const _ScaffoldWithDrawer(this.navigationShell);

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: const NavigationAppBar(),
      body: navigationShell,
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(border: Border()),
              margin: EdgeInsets.zero,
              child: Center(
                child: Text(
                  App.title,
                  style: theme.textTheme.bodyMedium!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(
              child: _NavigationRail(
                navigationShell: navigationShell,
                expand: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationRail extends StatelessWidget {
  const _NavigationRail({required this.navigationShell, required this.expand});

  final StatefulNavigationShell navigationShell;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return NavigationRail(
      extended: expand,
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
    );
  }
}

// class _ScaffoldWithNavigationBar extends StatelessWidget {
//   const _ScaffoldWithNavigationBar(this.navigationShell);

//   final StatefulNavigationShell navigationShell;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const NavigationAppBar(),
//       body: navigationShell,
//       bottomNavigationBar: NavigationBar(
//         selectedIndex: navigationShell.currentIndex,
//         onDestinationSelected: (index) {
//           navigationShell.goBranch(
//             index,
//             initialLocation: index == navigationShell.currentIndex,
//           );
//         },
//         destinations: [
//           for (final item in NavigationItem.values)
//             NavigationDestination(
//               icon: Icon(item.iconData),
//               label: item.label,
//             ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ContentView(
      child: PageHeader(title: 'Users'),
    );
  }
}

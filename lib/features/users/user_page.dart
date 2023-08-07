import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context) {
    return const ContentView(
      child: PageHeader(title: 'User'),
    );
  }
}

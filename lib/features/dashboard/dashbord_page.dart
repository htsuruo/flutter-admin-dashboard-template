import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ContentView(
      child: PageHeader(title: 'Dashboard'),
    );
  }
}

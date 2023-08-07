import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard_template/widgets/summary_card.dart';
import 'package:gap/gap.dart';
import 'package:intersperse/intersperse.dart';

import '../../widgets/widgets.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    const summaryCards = [
      SummaryCard(title: 'Total Sales', value: '\$125,000'),
      SummaryCard(title: 'Total Users', value: '12,000'),
      SummaryCard(title: 'KPI Progress Rate', value: '52.3%'),
    ];
    return ContentView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageHeader(
            title: 'Dashboard',
            description: 'A summary of key data and insights on your project.',
          ),
          const Gap(16),
          Row(
            children: summaryCards
                .map<Widget>((card) => Expanded(child: card))
                .intersperse(const Gap(16))
                .toList(),
          )
        ],
      ),
    );
  }
}

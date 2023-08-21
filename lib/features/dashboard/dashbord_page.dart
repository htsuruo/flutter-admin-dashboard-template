import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard_template/features/dashboard/dummy_inventories.dart';
import 'package:flutter_admin_dashboard_template/features/dashboard/inventory.dart';
import 'package:gap/gap.dart';
import 'package:intersperse/intersperse.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

import '../../widgets/widgets.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);
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
          if (responsive.isMobile)
            ...summaryCards
          else
            Row(
              children: summaryCards
                  .map<Widget>((card) => Expanded(child: card))
                  .intersperse(const Gap(16))
                  .toList(),
            ),
          const Gap(16),
          const Expanded(
            child: _TableView(),
          ),
        ],
      ),
    );
  }
}

class _TableView extends StatelessWidget {
  const _TableView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final decoration = TableSpanDecoration(
      border: TableSpanBorder(
        trailing: BorderSide(color: theme.dividerColor),
      ),
    );
    final inventories = dummyInventories;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: TableView.builder(
        columnCount: Inventory.itemCount,
        rowCount: inventories.length,
        pinnedRowCount: 1,
        pinnedColumnCount: 1,
        columnBuilder: (index) {
          return TableSpan(
            foregroundDecoration: index == 0 ? decoration : null,
            // Viewportに対して8分割した幅に調整してくれる
            extent: const FractionalTableSpanExtent(1 / 8),
          );
        },
        rowBuilder: (index) {
          return TableSpan(
            foregroundDecoration: index == 0 ? decoration : null,
            extent: const FixedTableSpanExtent(50),
          );
        },
        cellBuilder: (context, vicinity) {
          final isStickyHeader = vicinity.xIndex == 0 || vicinity.yIndex == 0;
          var label = '';
          if (vicinity.yIndex == 0) {
            switch (vicinity.xIndex) {
              case 0:
                label = 'ID';
              case 1:
                label = 'Category';
              case 2:
                label = 'Brand';
              case 3:
                label = 'Supplier';
              case 4:
                label = 'Minimum Stock';
              case 5:
                label = 'Update Date';
              case 6:
                label = 'Tax Rate';
              case 7:
                label = 'Notes';
              case 8:
                label = 'Product Size';
              case 9:
                label = 'Product Weight';
              case 10:
                label = 'Partnership Info';
              case 11:
                label = 'Location';
            }
          } else {
            final inventory = inventories[vicinity.yIndex - 1];
            switch (vicinity.xIndex) {
              case 0:
                label = inventory.inventoryId;
              case 1:
                label = inventory.category;
              case 2:
                label = inventory.brand;
              case 3:
                label = inventory.supplier;
              case 4:
                label = inventory.minimumStock.toString();
              case 5:
                label = inventory.updateDate;
              case 6:
                label = inventory.taxRate.toString();
              case 7:
                label = inventory.notes;
              case 8:
                label = inventory.productSize;
              case 9:
                label = inventory.productWeight;
              case 10:
                label = inventory.partnershipProgramInfo;
              case 11:
                label = inventory.storageLocation;
            }
          }
          return ColoredBox(
            color: isStickyHeader ? Colors.transparent : colorScheme.background,
            child: Center(
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    label,
                    style: TextStyle(
                      fontWeight: isStickyHeader ? FontWeight.w600 : null,
                      color: isStickyHeader ? null : colorScheme.outline,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

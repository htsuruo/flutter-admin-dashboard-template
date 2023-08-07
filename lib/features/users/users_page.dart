import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../widgets/widgets.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ContentView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageHeader(title: 'Users'),
          const Gap(16),
          Expanded(
            child: Card(
              child: ListView.separated(
                itemCount: 50,
                padding: const EdgeInsets.all(16),
                separatorBuilder: (context, _) => const Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('$index'),
                    subtitle: const Text('text'),
                    trailing: const Icon(Icons.navigate_next_outlined),
                    onTap: () {},
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

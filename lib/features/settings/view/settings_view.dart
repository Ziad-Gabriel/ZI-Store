import 'package:flutter/material.dart';
import 'package:zi_store/features/settings/widgets/account_container.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [AccountContainer()]),
    );
  }
}

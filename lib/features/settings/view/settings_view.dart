import 'package:flutter/material.dart';
import 'package:zi_store/features/settings/widgets/account_container.dart';
import 'package:zi_store/features/settings/widgets/theme_toggle.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AccountContainer(),
          Text(
            'App Preferences',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          ThemeToggle(),
        ],
      ),
    );
  }
}

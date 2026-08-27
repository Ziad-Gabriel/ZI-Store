import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zi_store/core/providers/theme_provider.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final List<IconData> icons = [
      Icons.light_mode_outlined,
      Icons.dark_mode_outlined,
      Icons.brightness_medium_outlined,
    ];
    final List<String> titles = ['light', 'dark', 'system'];
    final int currentTheme = context.watch<ThemeProvider>().getThemeIndex;
    return Card(
      elevation: 2,
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 8,
          children: [
            Row(
              spacing: 6,
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.primary.withAlpha(80),
                  child: Icon(
                    Icons.palette_outlined,
                    size: 26,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text(
                  'Appearance',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            Container(
              height: 65,
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withAlpha(40),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Row(
                  spacing: 8,
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(
                    3,
                    (index) => Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (currentTheme == index) return;
                          context.read<ThemeProvider>().setThemeMode(index);
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: currentTheme == index
                                ? Theme.of(context).colorScheme.primaryContainer
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            spacing: 4,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                icons[index],
                                size: 26,
                                color: currentTheme == index
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.onSurface,
                              ),
                              Text(
                                titles[index],
                                style: Theme.of(context).textTheme.bodySmall!
                                    .copyWith(
                                      color: currentTheme == index
                                          ? Theme.of(
                                              context,
                                            ).colorScheme.primary
                                          : Theme.of(
                                              context,
                                            ).colorScheme.onSurface,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

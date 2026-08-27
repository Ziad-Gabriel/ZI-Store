import 'package:flutter/material.dart';

class IosAuth extends StatelessWidget {
  const IosAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Theme.of(context).colorScheme.onSurface,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.apple,
                size: 34,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              // SvgPicture.asset('assets/logo/google.svg', height: 40, width: 40),
              Text(
                'Apple',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

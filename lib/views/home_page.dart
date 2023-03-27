import 'package:flutter/material.dart';

import '../constants/gaps.dart';
import '../constants/ui_defaults.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: kPaddingAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Text(
              'Dictionary',
              textAlign: TextAlign.center,
              style: textTheme.displaySmall,
            ),
            Text(
              'Search for a word',
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium,
            ),
            gapH4,
            const TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: kBorderRadiusAllMedium,
                ),
                isDense: true,
                filled: true,
              ),
            ),
            const Spacer(),
            TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: kBorderRadiusAllSmall),
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                child: const Text('Search')),
          ],
        ),
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../widgets/search_field_and_button.dart';

class SearchWordView extends HookWidget {
  const SearchWordView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final wordController = useTextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
        const Spacer(),
        SearchFieldAndButton(wordController),
        const Spacer(),
        const Spacer(),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/dicitonary_cubit/dictionary_cubit.dart';
import '../constants/gaps.dart';
import '../constants/ui_defaults.dart';
import '../utils/functions.dart';

class SearchFieldAndButton extends StatelessWidget {
  const SearchFieldAndButton(this.wordController, {super.key});

  final TextEditingController wordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: wordController,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            hintText: 'Enter a word',
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: kBorderRadiusAllSmall,
            ),
            isDense: true,
            filled: true,
          ),
        ),
        gapH4,
        TextButton(
          onPressed: () {
            final word = wordController.text.trim();
            if (word.isNotEmpty) {
              context.read<DictionaryCubit>().searchWord(word);
            } else {
              showSnackBar('Please enter a word');
            }
          },
          style: TextButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: kBorderRadiusAllSmall),
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          child: const Text('Search'),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../constants/gaps.dart';
import '../constants/ui_defaults.dart';
import '../models/word_details.dart';
import '../utils/extensions.dart';

class WordDetailsPage extends StatelessWidget {
  const WordDetailsPage(this.wordDetails, {Key? key}) : super(key: key);

  final WordDetails wordDetails;

  static const routeName = '/word-details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(wordDetails.word.capitalize())),
      body: Padding(
        padding: kPaddingAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Text('Meaning', style: Theme.of(context).textTheme.titleMedium),
            gapH4,
            ...wordDetails.meanings.map((e) {
              return Card(
                child: Padding(
                  padding: kPaddingAll,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e.partOfSpeech.capitalize(),
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 8),
                      Text(e.definitions.map((e) => e.definition).join(', ')),
                      gapH2,
                      if (e.synonyms.isNotEmpty)
                        Text('Synonyms: ${e.synonyms.join(', ')}'),
                      gapH2,
                      if (e.antonyms.isNotEmpty)
                        Text('Antonyms: ${e.antonyms.join(', ')}'),
                    ],
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

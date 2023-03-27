import 'package:flutter/material.dart';

import '../constants/global_keys.dart';
import '../models/word_details.dart';
import '../utils/extensions.dart';
import 'word_details_page.dart';

class ResultListPage extends StatelessWidget {
  const ResultListPage(this.words, {Key? key}) : super(key: key);

  final List<WordDetails> words;

  static const routeName = '/result-list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Result')),
      body: ListView.separated(
          itemCount: words.length,
          itemBuilder: (_, i) => ListTile(
                onTap: () => navigatorKey.currentState!
                    .pushNamed(WordDetailsPage.routeName, arguments: words[i]),
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                  child: Text('${i + 1}'),
                ),
                title: Text(words[i].word.capitalize()),
              ),
          separatorBuilder: (_, __) => const Divider()),
    );
  }
}

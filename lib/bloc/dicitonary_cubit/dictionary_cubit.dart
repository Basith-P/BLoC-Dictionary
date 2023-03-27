import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart' show debugPrint, immutable;

import '../../models/word_details.dart';
import '../../repository/word_repository.dart';

part 'dictionary_state.dart';

class DictionaryCubit extends Cubit<DictionaryState> {
  final WordRepostory _repostory;

  DictionaryCubit(this._repostory) : super(const NoWordSarchedState());

  void searchWord(String word) async {
    emit(const WordSearchingState());

    try {
      final results = await _repostory.getWordDetails(word);
      if (results.isEmpty) {
        emit(NoResultFoundState());
      } else {
        debugPrint(results.toString());
        emit(ResultFoundState(results));
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(ErrorState(message: e.toString()));
    }
  }
}

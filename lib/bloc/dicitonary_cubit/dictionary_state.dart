part of 'dictionary_cubit.dart';

@immutable
abstract class DictionaryState {
  const DictionaryState();
}

class NoWordSarchedState extends DictionaryState {
  const NoWordSarchedState();
}

class WordSearchingState extends DictionaryState {
  const WordSearchingState();
}

class ResultFoundState extends DictionaryState {
  final List<WordDetails> results;

  const ResultFoundState(this.results);
}

class NoResultFoundState extends DictionaryState {}

class ErrorState extends DictionaryState {
  final String? message;

  const ErrorState({this.message = "Something went wrong"});
}

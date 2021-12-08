import 'package:bloc_test/model/word_response.dart';
import 'package:bloc_test/repository/word_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DictionaryCubit extends Cubit<DictionaryState> {
  final WordRepo wordRepo;

  DictionaryCubit(this.wordRepo) : super(NoWordSearchedState());
  final queryController = TextEditingController();

  //ui will call this future and the future will get the data from the
  // repo and it will emit or generate new state updating the ui
  //this means user pressed search button
  Future getWordSearched() async {
    emit(WordSearchingState());

    try {
      final words = await wordRepo.getWordFromDictionary(queryController.text);
      print(words.toString());
      WordSearchedState(words);
    } catch (e) {
      print(e.toString());
      emit(ErrorState(e.toString()));
    }
  }
}

abstract class DictionaryState {}

class NoWordSearchedState extends DictionaryState {}

class WordSearchingState extends DictionaryState {}

class WordSearchedState extends DictionaryState {
  final List<WordResponse> words;

  WordSearchedState(this.words);
}

class ErrorState extends DictionaryState {
  final message;
  ErrorState(this.message);
}

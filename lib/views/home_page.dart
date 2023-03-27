import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../bloc/dicitonary_cubit/dictionary_cubit.dart';
import '../constants/global_keys.dart';
import '../constants/ui_defaults.dart';
import '../utils/functions.dart';
import '../widgets/loader.dart';
import 'result_list_page.dart';
import 'search_word_view.dart';

class MainPage extends HookWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: kPaddingAll,
              child: BlocConsumer<DictionaryCubit, DictionaryState>(
                listener: (context, state) {
                  if (state is ResultFoundState) {
                    navigatorKey.currentState?.pushNamed(
                      ResultListPage.routeName,
                      arguments: state.results,
                    );
                  } else if (state is NoResultFoundState) {
                    showSnackBar('No Definitions Found');
                  }
                },
                builder: (context, state) {
                  switch (state) {
                    case NoWordSarchedState():
                      return const SearchWordView();
                    case WordSearchingState():
                      return const Loader();
                    case ErrorState():
                      return ErrorWidget("Something went wrong");
                    default:
                      return const SearchWordView();
                  }
                },
              ))),
    );
  }
}

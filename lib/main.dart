import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/dicitonary_cubit/dictionary_cubit.dart';
import 'constants/global_keys.dart';
import 'repository/word_repository.dart';
import 'views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BlocProvider(
        create: (context) => DictionaryCubit(WordRepostory()),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.light(useMaterial3: true),
          darkTheme: ThemeData.dark(useMaterial3: true),
          scaffoldMessengerKey: scaffoldMessengerKey,
          home: const MainPage(),
        ),
      ),
    );
  }
}

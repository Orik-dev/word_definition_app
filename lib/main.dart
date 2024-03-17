
import 'package:flutter/material.dart';
import 'package:word_definition_app/block/dictionary_cubit.dart';
import 'package:word_definition_app/repository/word_repository.dart';
import 'package:word_definition_app/ui/home/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  const app = WordDefinition();
  runApp(app);
}

class WordDefinition extends StatelessWidget {
  const WordDefinition({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          background: Colors.blueGrey[900],
          seedColor: Colors.greenAccent,
        ),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => DictionaryCubit(WordRepository()),
        child:  const HomePage(),
      ),
    );
  }
}

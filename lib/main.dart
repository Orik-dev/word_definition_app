import 'package:flutter/material.dart';
import 'package:word_definition_app/ui/home/home_page.dart';

void main() {
  runApp(const WordDefinition());
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
      home: const HomePage(),
    );
  }
}

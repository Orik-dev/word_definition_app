import 'package:flutter/material.dart';
import 'package:word_definition_app/ui/home/widgets/get_search_form_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text('Welcome Word Definition App ', style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.greenAccent),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: const GetSearchFormWidget(),
    );
  }
}

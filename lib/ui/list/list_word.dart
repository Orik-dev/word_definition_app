import 'package:flutter/material.dart';
import 'package:word_definition_app/models/word_dictionary.dart';

class ListWord extends StatelessWidget {
  const ListWord(
    this.words, {
    super.key,
  });

  final List<WordDictionary> words;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text(
            words[index].word ?? '',
            style: TextStyle(
                fontSize: 30,
                color: words[index].isValid
                    ? Colors.white
                    : Colors.deepOrange),
          ),
          subtitle: Text(
            words[index].meanings?[0].partOfSpeech ?? '',
            style: const TextStyle(color: Colors.greenAccent),
          ),
        ),
        separatorBuilder: (context, index) => const Divider(
          color: Colors.grey,
        ),
        itemCount: words.length,
      ),
    );
  }
}

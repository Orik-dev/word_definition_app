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
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.greenAccent,
        title: Text('Вернуться назад'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text(
            words[index].word ?? '',
            style: TextStyle(
                fontSize: 30,
                color: words[index].isValid ? Colors.white : Colors.deepOrange),
          ),
          subtitle: Text(
            words[index].meanings?[0].partOfSpeech ?? '',
            style: const TextStyle(color: Colors.greenAccent),
          ),
          onTap: () {
            if (!words[index].isValid) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Слово отсутствует в словаре. '
                    'Пожалуйста, введите другое слово для поиска.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                  margin: EdgeInsets.only(bottom: 300, left: 50, right: 50),
                ),
              );
            }
          },
        ),
        separatorBuilder: (context, index) => const Divider(
          color: Colors.grey,
        ),
        itemCount: words.length,
      ),
    );
  }
}

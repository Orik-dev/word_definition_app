import 'package:flutter/material.dart';
import 'package:word_definition_app/models/word_dictionary.dart';

class DetailWord extends StatelessWidget {
  const DetailWord(this.wordDictionary, {super.key});

  final WordDictionary wordDictionary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.greenAccent,
        title: const Text('Подробно о слове'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(32),
          width: double.infinity,
          child: Column(
            children: [
              Text(
                '${wordDictionary.word}',
                style: const TextStyle(color: Colors.white, fontSize: 40),
              ),
              const SizedBox(height: 17),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final meanings = wordDictionary.meanings?[index];
                  final definition = meanings?.definitions;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meanings?.partOfSpeech ?? '',
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Definition : ${definition?[index].definition}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                              'Sentence  : ${definition?[index].example}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 8,
                        ),
                        itemCount: definition?.length ?? 0,
                      )
                    ],
                  );
                },
                itemCount: wordDictionary.meanings?.length ?? 0,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

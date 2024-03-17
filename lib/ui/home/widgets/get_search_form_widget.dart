import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_definition_app/block/dictionary_cubit.dart';

class GetSearchFormWidget extends StatelessWidget {
  const GetSearchFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();

    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const Spacer(),
          const Text(
            'Введите одно слово без пробелов для поиска в словаре',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlueAccent,
            ),
          ),
          const SizedBox(height: 32),
          TextField(
            controller: cubit.queryController,
            keyboardType: TextInputType.text,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z]+$'))
            ],
            decoration: InputDecoration(
              hintText: 'Найдите ваше слово..',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              fillColor: Colors.grey[100],
              filled: true,
              prefixIcon: const Icon(Icons.search),
              hintStyle: const TextStyle(color: Colors.grey),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (cubit.queryController.text.isNotEmpty) {
                  cubit.getWordSearched();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Введите слово для поиска'),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.red,
                      margin: EdgeInsets.only(bottom: 390, left: 10, right: 10),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                padding: const EdgeInsets.all(17),
              ),
              child: const Text('Search'),
            ),
          )
        ],
      ),
    );
  }
}

getLoadingWidget() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

getErrorWidget(message){
  return Center(child: Text(message));
}
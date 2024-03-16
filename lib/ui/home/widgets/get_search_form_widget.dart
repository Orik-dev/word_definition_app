import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_definition_app/block/dictionary_cubit.dart';

class GetSearchFormWidget extends StatelessWidget {
  const GetSearchFormWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final cubit = context.watch<DictionaryCubit>();

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Spacer(),
          const Text(
            'Quickly search any word you desire.',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlueAccent,
            ),
          ),
          const SizedBox(height: 32),
          TextField(
            controller: cubit.queryController,
            decoration: InputDecoration(
                hintText: 'Найдите ваше слово..',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Colors.transparent),
                ),
              fillColor:  Colors.grey[100],
              filled: true,
              prefixIcon: const Icon(Icons.search),
              hintStyle: const TextStyle(color: Colors.grey),
            ),

          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (){
                cubit.getWordSearched();
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

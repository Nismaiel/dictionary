import 'package:bloc_test/bloc/dictionary_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/src/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();

    getDictionaryFormWidget(ctx) {
      return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Spacer(),
            const Text(
              'Dictionary App',
              style: TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontSize: 34,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              'Search any word you want quickly',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(
              height: 32,
            ),
            TextField(
              controller: cubit.queryController,
              decoration: InputDecoration(
                  focusColor: Colors.deepOrangeAccent,
                  hintText: 'Search a word',
                  hintStyle: const TextStyle(color: Colors.deepOrange),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  fillColor: Colors.grey[100],
                  filled: true),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  //TODO
                  cubit.getWordSearched();
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrangeAccent,
                    padding: const EdgeInsets.all(16)),
                child: const Text('Search'),
              ),
            ),
          ],
        ),
      );
    }

    getLoadingWidget() {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.deepOrangeAccent,
        ),
      );
    }

    getErrorWidget(message) {
      return Center(
        child: Text(message,style:const TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold,fontSize: 28),),
      );
    }

    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: cubit.state is WordSearchedState
          ? getLoadingWidget()
          : cubit.state is ErrorState
              ? getErrorWidget("Error")
              : cubit.state is NoWordSearchedState
                  ? getDictionaryFormWidget(context)
                  : Container(),
    );
  }
}

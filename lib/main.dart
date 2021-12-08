import 'package:bloc_test/bloc/dictionary_cubit.dart';
import 'package:bloc_test/repository/word_repo.dart';
import 'package:bloc_test/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repo=WordRepo();
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        child:const HomeScreen(),
        create: (context)=> DictionaryCubit(repo),
      ),
    );
  }
}

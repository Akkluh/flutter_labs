import 'package:breadpolitech/data/repository/gif_repository.dart';
import 'package:breadpolitech/presentation/home_page/bloc/bloc.dart';
import 'package:breadpolitech/presentation/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      ),
      home: RepositoryProvider<GifRepository>(
        lazy: true,
        create: (_) => GifRepository(),
        child: BlocProvider<HomeBloc>(
          lazy: false,
          create: (context) => HomeBloc(context.read<GifRepository>()),
          child: const MyHomePage(title: 'Ключников Артём МОАИСбд-31',),
        ),
      )
    );
  }
}



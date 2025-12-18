import 'dart:io';

import 'package:breadpolitech/data/repository/gif_repository.dart';
import 'package:breadpolitech/presentation/home_page/bloc/bloc.dart';
import 'package:breadpolitech/presentation/home_page/home_page.dart';
import 'package:breadpolitech/presentation/like_bloc/like_bloc.dart';
import 'package:breadpolitech/presentation/locale_bloc/locale_bloc.dart';
import 'package:breadpolitech/presentation/locale_bloc/locale_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'components/locale/l10n/app_locale.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('liked_gifs');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocaleBloc>(
      lazy: false,
      create: (context) => LocaleBloc(Locale(Platform.localeName)),
      child: BlocBuilder<LocaleBloc, LocaleState>(
        builder: (context, state){
          return MaterialApp(
            title: 'Flutter Demo',
            locale: state.currentLocale,
            localizationsDelegates: AppLocale.localizationsDelegates,
            supportedLocales: AppLocale.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber)),
            home: RepositoryProvider<GifRepository>(
              lazy: true,
              create: (_) => GifRepository(),
              child: BlocProvider<LikeBloc>(
                lazy: false,
                create: (context) => LikeBloc(),
                child: BlocProvider<HomeBloc>(
                  lazy: false,
                  create: (context) => HomeBloc(context.read<GifRepository>()),
                  child: const MyHomePage(title: 'Ключников Артём МОАИСбд-31'),
            ),
              ),
          ),
        );
       },
      ),
    );
  }
}

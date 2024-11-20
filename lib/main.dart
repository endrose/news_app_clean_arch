import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_arch/configs/theme/app_themes.dart';
import 'package:news_app_clean_arch/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app_clean_arch/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news_app_clean_arch/features/daily_news/presentation/pages/home/daily_news.dart';

import 'injection_container.dart';

Future<void> main() async {
  await initializeDepedencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const DailyNews(),
      ),
    );
  }
}

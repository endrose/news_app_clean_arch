import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app_clean_arch/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app_clean_arch/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_app_clean_arch/features/daily_news/domain/repository/article_repository.dart';
import 'package:news_app_clean_arch/features/daily_news/domain/usecases/get_article.dart';
import 'package:news_app_clean_arch/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app_clean_arch/my_observer.dart';

final sl = GetIt.instance;

Future<void> initializeDepedencies() async {
  WidgetsFlutterBinding.ensureInitialized();

  // OBSERVER
  Bloc.observer = MyObserver();

  // DIO
  sl.registerSingleton<Dio>(Dio());

  // DEPEDENCIES
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  // REPOSITORY
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  // USECASE
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  // BLOCS
  sl.registerFactory<RemoteArticleBloc>(
    () => RemoteArticleBloc(sl()),
  );
}

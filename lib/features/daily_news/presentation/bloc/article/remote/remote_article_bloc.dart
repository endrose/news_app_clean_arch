import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_arch/core/resources/data_state.dart';
import 'package:news_app_clean_arch/features/daily_news/domain/usecases/get_article.dart';
import 'package:news_app_clean_arch/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news_app_clean_arch/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticleBloc(this._getArticleUseCase)
      : super(const RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emit) async {
    //

    final dataState = await _getArticleUseCase();
    // VAALID
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(dataState.data!));
    }

    // GAGAL
    if (dataState is DataFailed) {
      print(dataState.error!);
      emit(RemoteArticlesError(dataState.error!));
    }
  }
}
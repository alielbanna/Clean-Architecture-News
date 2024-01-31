import 'package:clean_architecture_news/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:clean_architecture_news/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_architecture_news/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:clean_architecture_news/features/daily_news/domain/repository/article_repository.dart';
import 'package:clean_architecture_news/features/daily_news/domain/usecases/get_article.dart';
import 'package:clean_architecture_news/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:clean_architecture_news/features/daily_news/domain/usecases/remove_article.dart';
import 'package:clean_architecture_news/features/daily_news/domain/usecases/save_article.dart';
import 'package:clean_architecture_news/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:clean_architecture_news/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';


final instance = GetIt.instance;

Future<void> initializeDependencies() async {

  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  instance.registerSingleton<AppDatabase>(database);
  
  // Dio
  instance.registerSingleton<Dio>(Dio());

  // Dependencies
  instance.registerSingleton<NewsApiService>(NewsApiService(instance()));

  instance.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(instance(),instance())
  );
  
  //UseCases
  instance.registerSingleton<GetArticleUseCase>(
    GetArticleUseCase(instance())
  );

  //Blocs
  instance.registerFactory<RemoteArticlesBloc>(
    ()=> RemoteArticlesBloc(instance())
  );

  instance.registerSingleton<GetSavedArticleUseCase>(
    GetSavedArticleUseCase(instance())
  );

  instance.registerSingleton<SaveArticleUseCase>(
    SaveArticleUseCase(instance())
  );
  
  instance.registerSingleton<RemoveArticleUseCase>(
    RemoveArticleUseCase(instance())
  );

  instance.registerFactory<LocalArticleBloc>(
    ()=> LocalArticleBloc(instance(),instance(),instance())
  );


}
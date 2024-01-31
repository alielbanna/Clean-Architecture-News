import 'package:clean_architecture_news/core/resources/data_state.dart';
import 'package:clean_architecture_news/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  // API functions
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  // Database functions
  Future < List < ArticleEntity >> getSavedArticles();
  Future < void > saveArticle(ArticleEntity article);
  Future < void > removeArticle(ArticleEntity article);
  
}
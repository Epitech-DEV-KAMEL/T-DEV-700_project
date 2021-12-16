package edu.epitech.bank_server.domain.services;

import edu.epitech.bank_server.domain.entities.Article;

import java.util.List;

public interface ArticleService {
    Article getArticle(Integer articleId);
    List<Article> getArticles();
    List<Article> getArticles(List<Integer> articleIds);

    Article save(Article article);
    void delete(Integer articleId);
}

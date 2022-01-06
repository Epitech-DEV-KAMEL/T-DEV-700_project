package edu.epitech.bank_server.domain.services.impl;

import edu.epitech.bank_server.core.errors.NotFoundException;
import edu.epitech.bank_server.data.repositories.ArticleRepository;
import edu.epitech.bank_server.domain.entities.Article;
import edu.epitech.bank_server.domain.services.ArticleService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ArticleServiceImpl implements ArticleService {
    final ArticleRepository articleRepository;

    @Override
    public Article getArticle(Integer articleId) {
        Optional<Article> existingArticle = articleRepository.findById(articleId);
        if (existingArticle.isEmpty()) throw new NotFoundException("Article not found");
        return existingArticle.get();
    }

    @Override
    public List<Article> getArticles() {
        return articleRepository.findAll();
    }

    @Override
    public List<Article> getArticles(List<Integer> articleIds) {
        return articleRepository.findAllById(articleIds);
    }

    @Override
    public Article save(Article article) {
        return articleRepository.save(article);
    }

    @Override
    public void delete(Integer articleId) {
        articleRepository.deleteById(articleId);
    }
}

package edu.epitech.bank_server.presentation.api;

import edu.epitech.bank_server.domain.entities.Article;
import edu.epitech.bank_server.domain.services.ArticleService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/articles")
public class ArticleController {

    final ArticleService articleService;

    @GetMapping("/{id}")
    public ResponseEntity<?> getArticle(@RequestParam("id") Integer id) {
        Article article = articleService.getArticle(id);
        return ResponseEntity.ok(article);
    }

    @GetMapping("/articles")
    public ResponseEntity<?> getArticles(@RequestBody(required = false) List<Integer> ids) {
        List<Article> articles;

        if (ids != null)
            articles = articleService.getArticles(ids);
        else
            articles = articleService.getArticles();

        return ResponseEntity.ok(articles);
    }
}

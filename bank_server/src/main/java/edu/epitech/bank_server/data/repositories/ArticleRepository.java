package edu.epitech.bank_server.data.repositories;

import edu.epitech.bank_server.domain.entities.Article;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ArticleRepository extends JpaRepository<Article, Integer> {
}

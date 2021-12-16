package edu.epitech.bank_server.domain.entities;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

import java.util.List;
import java.util.stream.Collectors;

@Getter
@RequiredArgsConstructor
public class OrderArticle {
    final int id;
    final int amount;

    public static List<Integer> getIds(List<OrderArticle> orderArticles) {
        return orderArticles.stream()
            .map(OrderArticle::getId)
            .collect(Collectors.toList());
    }
}
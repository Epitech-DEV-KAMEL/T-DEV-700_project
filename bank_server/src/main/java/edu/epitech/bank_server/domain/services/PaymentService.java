package edu.epitech.bank_server.domain.services;

import edu.epitech.bank_server.domain.entities.BankCard;
import edu.epitech.bank_server.domain.entities.OrderArticle;

import java.util.List;

public interface PaymentService {
    void pay(List<OrderArticle> articles, BankCard card);
    void pay(List<OrderArticle> articles, String chequeId);
}

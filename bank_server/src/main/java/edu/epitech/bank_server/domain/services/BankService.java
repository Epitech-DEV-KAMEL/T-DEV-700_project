package edu.epitech.bank_server.domain.services;

import edu.epitech.bank_server.domain.entities.BankCard;
import edu.epitech.bank_server.domain.entities.Cheque;
import edu.epitech.bank_server.domain.entities.Order;

public interface BankService {
    boolean isValidCard(BankCard card);
    void payWithCard(BankCard card, Order order);
    void payWithCheque(Cheque cheque, Order order);
}

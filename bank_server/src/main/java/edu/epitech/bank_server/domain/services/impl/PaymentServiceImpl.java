package edu.epitech.bank_server.domain.services.impl;

import edu.epitech.bank_server.core.errors.NotFoundException;
import edu.epitech.bank_server.core.errors.PaymentRefused;
import edu.epitech.bank_server.data.repositories.ArticleRepository;
import edu.epitech.bank_server.data.repositories.BankAccountRepository;
import edu.epitech.bank_server.data.repositories.BankCardRepository;
import edu.epitech.bank_server.data.repositories.ChequeRepository;
import edu.epitech.bank_server.domain.entities.*;
import edu.epitech.bank_server.domain.services.PaymentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class PaymentServiceImpl implements PaymentService {
    final BankCardRepository bankCardRepository;
    final BankAccountRepository bankAccountRepository;
    final ChequeRepository chequeRepository;
    final ArticleRepository articleRepository;

    @Override
    public void pay(List<OrderArticle> orderArticles, BankCard card) {
        throwIfInvalidCard(card);
        Optional<BankCard> bankCard = bankCardRepository.findById(card.getAccountNumber());
        if (bankCard.isEmpty()) throw new PaymentRefused("Card does not exits");

        double totalPrice = getTotalPrice(orderArticles);

        Optional<BankAccount> existingBankAccount = bankAccountRepository.findById(card.getAccountNumber());
        if (existingBankAccount.isEmpty()) throw new PaymentRefused("Bank Account does not exists");
        BankAccount bankAccount = existingBankAccount.get();

        if (!bankAccount.canBeUsedToPay(totalPrice)) throw new PaymentRefused("Not enough money into your bank account");
        bankAccount.debit(totalPrice);
        bankAccountRepository.save(bankAccount);
    }

    private void throwIfInvalidCard(BankCard card) throws PaymentRefused {
        if (card.getAccountNumber().isBlank() || card.getAccountNumber().isEmpty()) throw new PaymentRefused("No card account provided");
        if (card.getExpirationDate().before(new Date(System.currentTimeMillis()))) throw new PaymentRefused("Card expired");

        Optional<BankCard> existingBankCard = bankCardRepository.findById(card.getAccountNumber());
        if (existingBankCard.isEmpty()) throw new PaymentRefused("Card not exist");

        BankCard bankCard = existingBankCard.get();
        if (!bankCard.equals(card)) throw new PaymentRefused("Wrong code");
    }

    @Override
    public void pay(List<OrderArticle> orderArticles, String chequeId) {
        Optional<Cheque> existingCheque = chequeRepository.findById(chequeId);
        if (existingCheque.isEmpty()) throw new PaymentRefused("Cheque not exist");
        Cheque cheque = existingCheque.get();

        double totalPrice = getTotalPrice(orderArticles);

        if (!cheque.canBeUsedToPay(totalPrice)) throw new PaymentRefused("The amount of given cheque is lower than the total bill price, or the total bill price is negative.");

        cheque.debit(totalPrice);
        chequeRepository.save(cheque);
    }

    private double getTotalPrice(List<OrderArticle> orderArticles) {
        List<Integer> articleIds = OrderArticle.getIds(orderArticles);
        List<Article> articles = articleRepository.findAllById(articleIds);

        if (articles.size() != orderArticles.size()) throw new NotFoundException("One or more articles don't exists");

        double totalPrice = 0;
        for (int i = 0; i < orderArticles.size(); i++) {
            totalPrice += orderArticles.get(i).getAmount() * articles.get(i).getPrice();
        }

        return totalPrice;
    }
}

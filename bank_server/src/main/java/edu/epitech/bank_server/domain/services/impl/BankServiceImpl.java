package edu.epitech.bank_server.domain.services.impl;

import edu.epitech.bank_server.data.repositories.BankAccountRepository;
import edu.epitech.bank_server.data.repositories.BankCardRepository;
import edu.epitech.bank_server.data.repositories.OrderRepository;
import edu.epitech.bank_server.data.repositories.PaymentRepository;
import edu.epitech.bank_server.domain.entities.*;
import edu.epitech.bank_server.domain.services.BankService;
import edu.epitech.bank_server.domain.services.ChequeService;
import edu.epitech.bank_server.domain.services.LocalityService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Slf4j
@Service
@RequiredArgsConstructor
public class BankServiceImpl implements BankService {
    final BankAccountRepository bankAccountRepository;
    final BankCardRepository bankCardRepository;
    final OrderRepository orderRepository;
    final PaymentRepository paymentRepository;

    final ChequeService chequeService;
    final LocalityService localityService;

    @Override
    public boolean isValidCard(BankCard card) {
        if (card.getAccountNumber().isBlank() || card.getAccountNumber().isEmpty())
            return false;

        Optional<BankCard> existingBankCard = bankCardRepository.findById(card.getAccountNumber());
        if (existingBankCard.isEmpty()) return false;

        BankCard bankCard = existingBankCard.get();
        return bankCard.equals(card);
    }

    @Override
    public boolean payWithCard(BankCard card, Order order) {
        if (!isValidCard(card)) return false;

        BankAccount bankAccount = bankAccountRepository.getById(card.getAccountNumber());

        if (bankAccount.getAmount() < order.getTotalPrice()) return false;

        Order persistedOrder = orderRepository.save(order);
        Locality currentLocality = localityService.getCurrentLocality();
        paymentRepository.save(new Payment(persistedOrder, PaymentMode.Card, currentLocality));

        bankAccount.debit(order.getTotalPrice());
        bankAccountRepository.save(bankAccount);
        return true;
    }

    @Override
    public boolean payWithCheque(Cheque cheque, Order order) {
        if (!chequeService.isValid(cheque)) return false;
        Cheque persistedCheque = chequeService.getCheque(cheque.getId());
        if (persistedCheque.hasBeenUsed()) return false;
        if (persistedCheque.getAmount() < order.getTotalPrice()) return false;


        Order persistedOrder = orderRepository.save(order);
        Locality currentLocality = localityService.getCurrentLocality();
        paymentRepository.save(new Payment(persistedOrder, PaymentMode.Cheque, currentLocality));

        chequeService.markAsUsed(persistedCheque);
        return true;
    }
}

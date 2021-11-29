package edu.epitech.bank_server.domain.services.impl;

import edu.epitech.bank_server.core.errors.PaymentRefused;
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

import java.util.Date;
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
        if (card.getAccountNumber().isBlank() || card.getAccountNumber().isEmpty()) throw new PaymentRefused("No card account provided");
        if (card.getExpirationDate().before(new Date(System.currentTimeMillis()))) throw new PaymentRefused("Card expired");

        Optional<BankCard> existingBankCard = bankCardRepository.findById(card.getAccountNumber());
        if (existingBankCard.isEmpty()) throw new PaymentRefused("Card not exist");

        BankCard bankCard = existingBankCard.get();
        if (!bankCard.equals(card)) throw new PaymentRefused("Wrong code");
        return true;
    }

    @Override
    public void payWithCard(BankCard card, Order order) {
        if (!isValidCard(card)) return;

        BankAccount bankAccount = bankAccountRepository.getById(card.getAccountNumber());

        if (bankAccount.getAmount() < order.getTotalPrice()) throw new PaymentRefused("No enough money on client account");

        Order persistedOrder = orderRepository.save(order);
        Locality currentLocality = localityService.getCurrentLocality();
        paymentRepository.save(new Payment(persistedOrder, PaymentMode.Card, currentLocality));

        bankAccount.debit(order.getTotalPrice());
        bankAccountRepository.save(bankAccount);
    }

    @Override
    public void payWithCheque(Cheque cheque, Order order) {
        if (!chequeService.isValid(cheque)) throw new PaymentRefused("Corrupted Cheque");
        Cheque persistedCheque = chequeService.getCheque(cheque.getId());
        if (persistedCheque.hasBeenUsed()) throw new PaymentRefused("Cheque has already been used");
        if (persistedCheque.getAmount() < order.getTotalPrice()) throw new PaymentRefused("Cheque amount is smaller than total's bill");

        Locality currentLocality = localityService.getCurrentLocality();
        order.setLocality(currentLocality);
        Order persistedOrder = orderRepository.save(order);
        paymentRepository.save(new Payment(persistedOrder, PaymentMode.Cheque, currentLocality));
        chequeService.markAsUsed(persistedCheque);
    }
}

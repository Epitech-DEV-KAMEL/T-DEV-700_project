package edu.epitech.bank_server.domain.entities;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

class BankAccountTest {

    @Test
    void shouldReturnFalseWhenNotEnoughAmountToPay() {
        BankAccount bankAccountWithNotEnoughAmount = new BankAccount("account_number", "account_owner", 0.01);
        double someToDebit = 500.0;

        Assertions.assertFalse(bankAccountWithNotEnoughAmount.canBeUsedToPay(someToDebit));
    }

    @Test
    void shouldReturnTrueWhenEnoughAmountToPay() {
        BankAccount bankAccountNotEnoughAmount = new BankAccount("account_number", "account_owner", 10000.0);
        double someToDebit = 500.0;

        Assertions.assertTrue(bankAccountNotEnoughAmount.canBeUsedToPay(someToDebit));
    }

    @Test
    void shouldReturnFalseWhenTheAmountToDebitIsNegative() {
        BankAccount bankAccountNotEnoughAmount = new BankAccount("account_number", "account_owner", 10000.0);
        double someToDebit = -500.0;

        Assertions.assertFalse(bankAccountNotEnoughAmount.canBeUsedToPay(someToDebit));
    }

    @Test
    void shouldMinusChequeAmountByAmountToDebitWithoutCheck() {
        BankAccount bankAccountNotEnoughAmount = new BankAccount("account_number", "account_owner", 10000.0);
        double someToDebit = 500.0;

        bankAccountNotEnoughAmount.debit(someToDebit);
        Assertions.assertEquals(9500.0, bankAccountNotEnoughAmount.getAmount());
    }
}
package edu.epitech.bank_server.domain.entities;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

class ChequeTest {

    @Test
    void shouldReturnFalseWhenNotEnoughAmountToPay() {
        Cheque chequeWithNotEnoughAmount = new Cheque(0.01);
        double someToDebit = 500.0;

        Assertions.assertFalse(chequeWithNotEnoughAmount.canBeUsedToPay(someToDebit));
    }

    @Test
    void shouldReturnTrueWhenEnoughAmountToPay() {
        Cheque chequeWithEnoughAmount = new Cheque(10000.0);
        double someToDebit = 500.0;

        Assertions.assertTrue(chequeWithEnoughAmount.canBeUsedToPay(someToDebit));
    }

    @Test
    void shouldReturnFalseWhenTheAmountToDebitIsNegative() {
        Cheque chequeWithEnoughAmount = new Cheque(10000.0);
        double someToDebit = -500.0;

        Assertions.assertFalse(chequeWithEnoughAmount.canBeUsedToPay(someToDebit));
    }

    @Test
    void shouldMinusChequeAmountByAmountToDebitWithoutCheck() {
        Cheque chequeWithEnoughAmount = new Cheque(10000.0);
        double someToDebit = 500.0;

        chequeWithEnoughAmount.debit(someToDebit);
        Assertions.assertEquals(9500.0, chequeWithEnoughAmount.getAmount());
    }
}
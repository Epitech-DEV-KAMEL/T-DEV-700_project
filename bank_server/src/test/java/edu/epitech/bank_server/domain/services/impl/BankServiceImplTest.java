package edu.epitech.bank_server.domain.services.impl;

import edu.epitech.bank_server.data.repositories.BankCardRepository;
import edu.epitech.bank_server.domain.entities.BankCard;
import edu.epitech.bank_server.domain.services.BankService;
import lombok.RequiredArgsConstructor;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Bean;

import java.util.Calendar;
import java.util.Date;
import java.util.Optional;

@RequiredArgsConstructor
@SpringBootTest
class BankServiceImplTest {

    final BankCardRepository bankCardRepository;
    final BankService bankService;

    private static String validAccountNumber;
    private static String validCardholderName;
    private static String validSecurityCode;
    private static String validBrandMark;
    private static Date validExpirationDate;
    private static BankCard testValidBankCard;

    private static Date invalidExpirationDate;

    @BeforeAll
    static void setUp() {
        validAccountNumber = "1234 5678 9101 1121";
        validCardholderName = "Mr. Test";
        validSecurityCode = "012";
        validBrandMark = "MasterCard";

        Calendar calendar = Calendar.getInstance();

        calendar.add(Calendar.YEAR, 3);
        validExpirationDate = calendar.getTime();

        calendar.add(Calendar.YEAR, -6);
        invalidExpirationDate = calendar.getTime();

        testValidBankCard = new BankCard(
            validAccountNumber,
            validCardholderName,
            validSecurityCode,
            validBrandMark,
            validExpirationDate
        );
    }

    @Test
    public void whenValidCard_thenValidatorShouldNotThrow() {
        Mockito.when(bankCardRepository.findById(validAccountNumber))
            .thenReturn(Optional.ofNullable(testValidBankCard));

        boolean isValidCard = bankService.isValidCard(testValidBankCard);
        Assertions.assertTrue(isValidCard);
    }
}
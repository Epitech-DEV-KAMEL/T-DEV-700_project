package edu.epitech.bank_server.presentation.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BankCardDto {
    private String accountNumber;
    private String cardholderName;
    private String cardSecurityCode;
    private String brandMark;
    private Date expirationDate;
}

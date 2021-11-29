package edu.epitech.bank_server.presentation.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PayWithCardDto {
    private Double totalPrice;
    private String detailedBill;
    private BankCardDto card;
}

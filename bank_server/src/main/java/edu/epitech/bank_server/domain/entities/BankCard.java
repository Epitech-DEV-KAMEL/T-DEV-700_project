package edu.epitech.bank_server.domain.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "bank_cards")
public class BankCard {
    @Id
    private String accountNumber;
    private String cardholderName;
    private String cardSecurityCode;
    private String brandMark;
    private Date expirationDate;
}

package edu.epitech.bank_server.domain.entities;

import lombok.*;

import javax.persistence.*;
import java.util.Base64;
import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "cheques")
public class Cheque {
    @Id
    private String id;
    private Double amount;

    public Cheque(double amount) {
        this.id = UUID.randomUUID().toString();
        this.amount = amount;
    }

    public boolean canBeUsedToPay(Double amountToPay) {
        if (amountToPay < 0) return false;
        return amount >= amountToPay;
    }

    public void debit(Double amount) {
        this.amount -= amount;
    }
}

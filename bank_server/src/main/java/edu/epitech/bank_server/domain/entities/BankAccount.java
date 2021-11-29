package edu.epitech.bank_server.domain.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "bank_accounts")
public class BankAccount {
    @Id
    private String accountNumber;
    private String owner;
    private Double amount;

    public void credit(Double amount) {
        this.amount += amount;
    }

    public void debit(Double amount) {
        this.amount -= amount;
    }
}

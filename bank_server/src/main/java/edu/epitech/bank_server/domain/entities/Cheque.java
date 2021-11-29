package edu.epitech.bank_server.domain.entities;

import lombok.*;

import javax.persistence.*;
import java.util.Base64;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "cheques")
public class Cheque {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String token;
    private Double amount;
    private Boolean used = false;

    public Cheque(Double amount) {
        this.amount = amount;
    }

    public Cheque(String token, Double amount) {
        this.token = token;
        this.amount = amount;
    }

    public boolean hasBeenUsed() {
        return this.used;
    }
    public void setUseStatus(boolean used) {
        this.used = used;
    }
}

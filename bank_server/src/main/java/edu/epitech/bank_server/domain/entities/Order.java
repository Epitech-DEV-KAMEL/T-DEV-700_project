package edu.epitech.bank_server.domain.entities;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@NoArgsConstructor
@Entity
@Table(name = "orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Double totalPrice;
    private String detailedBill;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "locality_id")
    private Locality locality;

    public Order(Double totalPrice, String detailedBill) {
        this.totalPrice = totalPrice;
        this.detailedBill = detailedBill;
    }
}

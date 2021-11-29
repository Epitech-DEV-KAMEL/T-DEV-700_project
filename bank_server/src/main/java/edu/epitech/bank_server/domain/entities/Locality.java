package edu.epitech.bank_server.domain.entities;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@NoArgsConstructor
@Entity
@Table(name = "localities")
public class Locality {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    private String password;

    public Locality(String name) {
        this.name = name;
    }

    public Locality(String name, String password) {
        this.name = name;
        this.password = password;
    }
}

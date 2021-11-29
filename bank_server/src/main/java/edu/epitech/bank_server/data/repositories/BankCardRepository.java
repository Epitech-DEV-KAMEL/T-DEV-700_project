package edu.epitech.bank_server.data.repositories;

import edu.epitech.bank_server.domain.entities.BankCard;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BankCardRepository extends JpaRepository<BankCard, String> {
}

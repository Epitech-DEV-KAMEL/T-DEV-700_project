package edu.epitech.bank_server.data.repositories;

import edu.epitech.bank_server.domain.entities.Cheque;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ChequeRepository extends JpaRepository<Cheque, String> {
}

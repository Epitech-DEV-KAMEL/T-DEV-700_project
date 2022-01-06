package edu.epitech.bank_server.data.repositories;

import edu.epitech.bank_server.domain.entities.BankAccount;
import jdk.jfr.Registered;
import org.springframework.data.jpa.repository.JpaRepository;

@Registered
public interface BankAccountRepository extends JpaRepository<BankAccount, String> {
}

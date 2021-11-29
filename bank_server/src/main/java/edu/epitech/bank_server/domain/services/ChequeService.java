package edu.epitech.bank_server.domain.services;

import edu.epitech.bank_server.domain.entities.Cheque;
import edu.epitech.bank_server.domain.entities.Locality;

public interface ChequeService {
    Cheque getCheque(Long id);
    Cheque create(Locality locality, double amount);
    boolean isValid(Cheque cheque);
    void markAsUsed(Cheque cheque);
}

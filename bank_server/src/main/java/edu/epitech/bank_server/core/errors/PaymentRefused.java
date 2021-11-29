package edu.epitech.bank_server.core.errors;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(code = HttpStatus.NOT_ACCEPTABLE, reason = "Payment refused")
public class PaymentRefused extends RuntimeException {
    public PaymentRefused(String message) {
        super(message);
    }
}

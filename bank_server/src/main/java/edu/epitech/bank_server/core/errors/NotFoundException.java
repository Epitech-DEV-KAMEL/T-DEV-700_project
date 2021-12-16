package edu.epitech.bank_server.core.errors;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(code = HttpStatus.NOT_FOUND, reason = "Not Found")
public class NotFoundException extends RuntimeException {
    public NotFoundException(String message) {
        super(message);
    }
}
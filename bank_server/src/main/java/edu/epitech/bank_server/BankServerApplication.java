package edu.epitech.bank_server;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;


@SpringBootApplication(exclude= {SecurityAutoConfiguration.class})

public class BankServerApplication {
    public static void main(String[] args) {
        SpringApplication.run(BankServerApplication.class, args);
    }
}

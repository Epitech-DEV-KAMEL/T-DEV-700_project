package edu.epitech.bank_server.presentation.api;

import edu.epitech.bank_server.domain.entities.Order;
import edu.epitech.bank_server.domain.services.BankService;
import edu.epitech.bank_server.presentation.dto.PayWithCardDto;
import edu.epitech.bank_server.presentation.dto.PayWithChequeDto;
import edu.epitech.bank_server.presentation.mappers.BankCardMappers;
import edu.epitech.bank_server.presentation.mappers.ChequeMappers;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.mapstruct.factory.Mappers;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/bank")
public class BankController {

    final BankService bankService;

    final BankCardMappers bankCardMappers = Mappers.getMapper(BankCardMappers.class);
    final ChequeMappers chequeMappers = Mappers.getMapper(ChequeMappers.class);

    @GetMapping("/pay/card")
    public ResponseEntity<?> pay(@RequestBody PayWithCardDto order) {
        bankService.payWithCard(bankCardMappers.toBankCard(order.getCard()), new Order(
            order.getTotalPrice(),
            order.getDetailedBill()
        ));
        return new ResponseEntity<>(HttpStatus.ACCEPTED);
    }

    @GetMapping("/pay/cheque")
    public ResponseEntity<?> pay(@RequestBody PayWithChequeDto order) {
        bankService.payWithCheque(chequeMappers.toCheque(order.getCheque()), new Order(
            order.getTotalPrice(),
            order.getDetailedBill()
        ));
        return new ResponseEntity<>(HttpStatus.ACCEPTED);
    }
}

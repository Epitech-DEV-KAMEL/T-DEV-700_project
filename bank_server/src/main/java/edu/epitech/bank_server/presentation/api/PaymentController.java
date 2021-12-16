package edu.epitech.bank_server.presentation.api;

import edu.epitech.bank_server.domain.entities.BankCard;
import edu.epitech.bank_server.domain.services.PaymentService;
import edu.epitech.bank_server.presentation.dto.PayByChequeDto;
import edu.epitech.bank_server.presentation.dto.PaymentByCardDto;
import edu.epitech.bank_server.presentation.mappers.BankCardMappers;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.mapstruct.factory.Mappers;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/pay")
public class PaymentController {
    final PaymentService paymentService;
    final BankCardMappers bankCardMappers = Mappers.getMapper(BankCardMappers.class);

    @PostMapping("/card")
    public ResponseEntity<?> payByCard(@RequestBody PaymentByCardDto paymentDto) {
        BankCard bankCard = bankCardMappers.toBankCard(paymentDto.getCard());
        paymentService.pay(paymentDto.getOrderArticles(), bankCard);
        return new ResponseEntity<>(HttpStatus.ACCEPTED);
    }

    @PostMapping("/cheque")
    public ResponseEntity<?> payByCheque(@RequestBody PayByChequeDto paymentDto) {
        paymentService.pay(paymentDto.getOrderArticles(), paymentDto.getChequeId());
        return new ResponseEntity<>(HttpStatus.ACCEPTED);
    }
}

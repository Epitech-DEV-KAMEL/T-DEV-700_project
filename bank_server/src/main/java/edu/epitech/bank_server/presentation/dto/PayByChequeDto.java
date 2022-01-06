package edu.epitech.bank_server.presentation.dto;

import edu.epitech.bank_server.domain.entities.OrderArticle;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PayByChequeDto {
    private String chequeId;
    private List<OrderArticle> orderArticles;
}

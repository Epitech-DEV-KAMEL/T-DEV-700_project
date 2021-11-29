package edu.epitech.bank_server.presentation.mappers;

import edu.epitech.bank_server.domain.entities.BankCard;
import edu.epitech.bank_server.presentation.dto.BankCardDto;
import org.mapstruct.Mapper;

@Mapper
public interface BankCardMappers {
    BankCard toBankCard(BankCardDto dto);
}

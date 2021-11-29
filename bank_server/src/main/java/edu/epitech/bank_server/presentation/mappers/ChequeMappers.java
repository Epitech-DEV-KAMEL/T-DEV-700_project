package edu.epitech.bank_server.presentation.mappers;

import edu.epitech.bank_server.domain.entities.Cheque;
import edu.epitech.bank_server.presentation.dto.ChequeDto;
import org.mapstruct.Mapper;

@Mapper
public interface ChequeMappers {
    Cheque toCheque(ChequeDto dto);
}

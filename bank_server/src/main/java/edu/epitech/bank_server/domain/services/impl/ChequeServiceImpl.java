package edu.epitech.bank_server.domain.services.impl;

import com.google.common.hash.Hashing;
import edu.epitech.bank_server.core.errors.PaymentRefused;
import edu.epitech.bank_server.data.repositories.ChequeRepository;
import edu.epitech.bank_server.data.repositories.LocalityRepository;
import edu.epitech.bank_server.domain.entities.Cheque;
import edu.epitech.bank_server.domain.entities.Locality;
import edu.epitech.bank_server.domain.services.ChequeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Base64;

@Slf4j
@Service
@RequiredArgsConstructor
public class ChequeServiceImpl implements ChequeService {
    final ChequeRepository chequeRepository;
    final LocalityRepository localityRepository;

    @Override
    public Cheque getCheque(Long id) {
        return chequeRepository.getById(id);
    }

    @Override
    public Cheque create(Locality locality, double amount) {
        Cheque persistedCheque = chequeRepository.save(new Cheque(amount));
        String token = createToken(persistedCheque.getId(), locality, amount);
        return chequeRepository.save(new Cheque(token, amount));
    }

    private String createToken(Long id, Locality locality, double amount) {
        Base64.Encoder encoder = Base64.getEncoder();

        String id_str = String.valueOf(id);
        String localityId_str = String.valueOf(amount);
        String amount_str = String.valueOf(amount);

        String encodedId = encoder.encodeToString(id_str.getBytes());
        String encodedLocality = encoder.encodeToString(localityId_str.getBytes());
        String encodedAmount = encoder.encodeToString(amount_str.getBytes());

        String token_hash = Hashing
            .hmacSha256(locality.getPassword().getBytes())
            .hashString(encodedId + localityId_str + amount_str, StandardCharsets.UTF_8)
            .toString();

        return encodedId + '.' + encodedLocality + '.' + encodedAmount + '.' + token_hash;
    }

    @Override
    public boolean isValid(Cheque cheque) {
        String token = cheque.getToken();

        String[] tokenParts = token.split("\\.");

        if (tokenParts.length != 4)
            throw new PaymentRefused("Invalid Cheque");

        String id_base64 = tokenParts[0];
        String localityId_base64 = tokenParts[1];
        String amount_base64 = tokenParts[2];

        Base64.Decoder decoder = Base64.getDecoder();
        Long id = Long.valueOf(Arrays.toString(decoder.decode(id_base64)));
        Integer localityId = Integer.valueOf(Arrays.toString(decoder.decode(localityId_base64)));
        double amount = Double.parseDouble(Arrays.toString(decoder.decode(amount_base64)));

        Locality locality = localityRepository.getById(localityId);

        return createToken(id, locality, amount).equals(token);
    }

    @Override
    public void markAsUsed(Cheque cheque) {
        cheque.setUseStatus(true);
        chequeRepository.save(cheque);
    }
}

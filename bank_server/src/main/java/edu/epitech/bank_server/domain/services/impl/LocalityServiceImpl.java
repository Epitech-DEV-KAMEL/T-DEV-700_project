package edu.epitech.bank_server.domain.services.impl;

import edu.epitech.bank_server.data.repositories.LocalityRepository;
import edu.epitech.bank_server.domain.entities.Locality;
import edu.epitech.bank_server.domain.services.LocalityService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class LocalityServiceImpl implements LocalityService {
    final LocalityRepository localityRepository;
    final PasswordEncoder passwordEncoder;

    private static Locality currentLocality;

    @Override
    public void saveCurrentLocality(String name, String password) {
        Locality persistedLocality = getLocalityByName(name);

        if (persistedLocality == null) {
            persistedLocality = new Locality(name);
        }

        String hashedPassword = passwordEncoder.encode(password);
        persistedLocality.setPassword(hashedPassword);

        currentLocality = localityRepository.save(new Locality(name, hashedPassword));
    }

    @Override
    public Locality getCurrentLocality() {
        return currentLocality;
    }

    @Override
    public Locality getLocalityById(Integer id) {
        return localityRepository.findById(id).orElse(null);
    }

    @Override
    public Locality getLocalityByName(String name) {
        return localityRepository.findByName(name).orElse(null);
    }
}

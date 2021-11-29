package edu.epitech.bank_server.domain.services;

import edu.epitech.bank_server.domain.entities.Locality;

public interface LocalityService {
    void saveCurrentLocality(String name, String password);
    Locality getCurrentLocality();
    Locality getLocalityById(Integer id);
    Locality getLocalityByName(String name);
}

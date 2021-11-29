package edu.epitech.bank_server.data.repositories;

import edu.epitech.bank_server.domain.entities.Locality;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface LocalityRepository extends JpaRepository<Locality, Integer> {
    Optional<Locality> findByName(String name);
}

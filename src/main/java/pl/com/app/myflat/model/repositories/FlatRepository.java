package pl.com.app.myflat.model.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.com.app.myflat.model.entities.Flat;

import java.util.List;

public interface FlatRepository extends JpaRepository <Flat, Long> {

    List<Flat> findAll();
    Flat getFlatByFlatNumber(Integer flatNumber);
    Flat findFlatByUser(Long id);
}

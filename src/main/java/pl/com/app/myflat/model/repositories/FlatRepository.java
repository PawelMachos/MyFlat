package pl.com.app.myflat.model.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.com.app.myflat.model.entities.Flat;

import java.util.List;
import java.util.Optional;

public interface FlatRepository extends JpaRepository <Flat, Long> {

    Flat findByFlatNumber(Long flatNumber);
    Optional<Flat> findById(Long flatId);

}

package pl.com.app.myflat.model.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.com.app.myflat.model.entities.Advert;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Optional;

public interface AdvertRepository extends JpaRepository<Advert, Long> {

    List<Advert> findAllBy();

    Optional<Advert> findByIdAndUserUsername(Long advertId, String userName);

    Advert findTopByOrderByCreatedAtDesc();

}

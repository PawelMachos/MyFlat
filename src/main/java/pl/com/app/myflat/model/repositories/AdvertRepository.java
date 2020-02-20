package pl.com.app.myflat.model.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.com.app.myflat.model.entities.Advert;

import java.util.List;
import java.util.Optional;

public interface AdvertRepository extends JpaRepository<Advert, Long> {

    List<Advert> findAllBy();

    List<Advert> findAllByCreatedDesc();

    List<Advert> findAllByOrderByUserFirstName();

    List<Advert> findAllByOrderByUserLastName();

    List<Advert> findAllByOrderByTitle();

    Optional<Advert> findByIdAndOwnerUsername(Long advertId, String username);
}

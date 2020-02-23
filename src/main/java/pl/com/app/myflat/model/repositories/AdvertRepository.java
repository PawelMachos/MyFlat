package pl.com.app.myflat.model.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.com.app.myflat.model.entities.Advert;

import java.util.Date;
import java.util.List;
import java.util.Optional;

public interface AdvertRepository extends JpaRepository<Advert, Long> {

    List<Advert> findAllBy();

    //List<Advert> findAllByCreatedAtOrderByUpdatedAt(Date createdAt, Date updatedAt);

    List<Advert> findByUser(String userName);

    Optional<Advert> findByIdAndUserUsername(Long advertId, String userName);

    //List<Advert> findAllByOrderByUserFirstName(String firstName);

    //List<Advert> findAllByOrderByUserLastName(String lastName);

    //List<Advert> findAllByOrderByTitle(String title);

   // Optional<Advert> findByIdAndOwnerUsername(Long advertId, String username);
}

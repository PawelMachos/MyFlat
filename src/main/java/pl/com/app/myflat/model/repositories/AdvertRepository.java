package pl.com.app.myflat.model.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.com.app.myflat.model.entities.Advert;

public interface AdvertRepository extends JpaRepository<Advert, Long> {
}

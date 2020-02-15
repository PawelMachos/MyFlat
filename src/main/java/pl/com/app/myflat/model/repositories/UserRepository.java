package pl.com.app.myflat.model.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.com.app.myflat.model.entities.User;

public interface UserRepository extends JpaRepository<User, Long> {

}

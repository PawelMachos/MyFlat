package pl.com.app.myflat.model.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.com.app.myflat.model.entities.User;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {

    User findByUsername(String userName);

    List<User> findAllByUsername(String userName);
}

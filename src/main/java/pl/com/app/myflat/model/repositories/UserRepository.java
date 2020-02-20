package pl.com.app.myflat.model.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.com.app.myflat.model.entities.Bill;
import pl.com.app.myflat.model.entities.User;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {

    User findUserByUsername(String username);

    @Query(value="SELECT b FROM User u JOIN u.bills b WHERE u.id = ?1")
    List<Bill> findAllBillsToPayForUser(Long id);

}

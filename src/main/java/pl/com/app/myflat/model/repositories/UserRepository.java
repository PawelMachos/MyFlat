package pl.com.app.myflat.model.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.com.app.myflat.model.entities.Bill;
import pl.com.app.myflat.model.entities.User;
import pl.com.app.myflat.model.enums.Category;

import java.util.List;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {


    @Query(value="SELECT b FROM User u JOIN u.bills b WHERE u.id = ?1")
    List<Bill> findAllBillsToPayForUser(Long id);

    User findByUsername(String userName);

    List<User> findAllByUsername(String userName);

}

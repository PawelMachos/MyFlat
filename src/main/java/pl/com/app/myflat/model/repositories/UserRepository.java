package pl.com.app.myflat.model.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.com.app.myflat.model.entities.Bill;
import pl.com.app.myflat.model.entities.User;

import java.util.List;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {


    @Query(value="SELECT b FROM User u JOIN u.bills b WHERE u.id = ?1")
    List<Bill> findAllBillsToPayForUser(Long id);

    User findByUsername(String userName);
    Optional <User> findById(Long id);


    //List<User> findAllByUsername(String userName);


}

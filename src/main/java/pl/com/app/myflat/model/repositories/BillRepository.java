package pl.com.app.myflat.model.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.com.app.myflat.model.entities.Bill;

public interface BillRepository extends JpaRepository<Bill, Long> {

}

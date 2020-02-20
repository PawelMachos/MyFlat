package pl.com.app.myflat.model.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.com.app.myflat.model.entities.Bill;
import pl.com.app.myflat.model.enums.Category;

import java.util.List;


public interface BillRepository extends JpaRepository<Bill, Long> {

   // Bill findBillByCategoryAndInvoiceDate_Month(Category category, int month);

}

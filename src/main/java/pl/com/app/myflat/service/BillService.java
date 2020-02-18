package pl.com.app.myflat.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.com.app.myflat.dto.LoggedUserDTO;
import pl.com.app.myflat.model.entities.Bill;
import pl.com.app.myflat.model.entities.User;
import pl.com.app.myflat.model.repositories.BillRepository;
import pl.com.app.myflat.model.repositories.UserRepository;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class BillService {

    private final BillRepository billRepository;
    private final UserRepository userRepository;
    @Autowired
    public BillService(BillRepository billRepository, UserRepository userRepository) {
        this.billRepository = billRepository;
        this.userRepository = userRepository;
    }

    public Integer showAllBillsToPay(LoggedUserDTO userDTO){
        int sum = 0;
        List<Bill> billsToPay = userRepository.findAllBillsToPayForUser(userDTO.getId())
                .stream().filter(bill-> bill.getActive()==true).collect(Collectors.toList());
        for(Bill b : billsToPay){
            sum+=b.getGrossAmount();
        }
        return sum;
    }

}

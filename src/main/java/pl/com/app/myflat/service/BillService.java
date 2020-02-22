package pl.com.app.myflat.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.com.app.myflat.dto.BillDTO;
import pl.com.app.myflat.model.entities.Bill;
import pl.com.app.myflat.model.enums.Category;
import pl.com.app.myflat.model.repositories.BillRepository;
import pl.com.app.myflat.model.repositories.UserRepository;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

    public Double showAllBillsToPay(Long id){
        double sum = 0;
        List<Bill> billsToPay = userRepository.findAllBillsToPayForUser(id)
                .stream().filter(bill-> bill.getActive()==true).collect(Collectors.toList());
        for(Bill b : billsToPay){
            sum+=b.getGrossAmount();
        }
        return sum;
    }

    public Map<Category,Double> allUnpaidBillsByCategory(Long id){
        List<BillDTO> bills = userRepository.findAllBillsToPayForUser(id)
                .stream()
                .map(bill->{
                    BillDTO billDTO = new BillDTO();
                    billDTO.setActive(bill.getActive());
                    billDTO.setCategory(bill.getCategory());
                    billDTO.setGrossAmount(bill.getGrossAmount());
                    billDTO.setInvoiceDate(bill.getInvoiceDate());
                    billDTO.setInvoiceNumber(bill.getInvoiceNumber());
                    return billDTO;
                })
                .filter(billDTO-> billDTO.getActive()==true).collect(Collectors.toList());

        Map<Category,Double> billsByCategory = new HashMap<>();
        for(BillDTO b : bills){
            billsByCategory.put(b.getCategory(),b.getGrossAmount());
        }
        return billsByCategory;
    }

    public Map<Category,Double> percentageOfGeneratedCosts(Long id){
        double sum = showAllBillsToPay(id);
        Map<Category,Double> bills = allUnpaidBillsByCategory(id);
        Map<Category,Double> percentageMap = new HashMap<>();
        for(Map.Entry<Category,Double> e: bills.entrySet()){
            percentageMap.put(e.getKey(),(e.getValue()*100)/sum);
        }
        return percentageMap;
    }

    public List<BillDTO> getInvoicesByCategory(Long id, Category category){

        List<BillDTO> bills = userRepository.findAllBillsToPayForUser(id)
                .stream()
                .map(bill->{
                    BillDTO billDTO = new BillDTO();
                    billDTO.setActive(bill.getActive());
                    billDTO.setCategory(bill.getCategory());
                    billDTO.setGrossAmount(bill.getGrossAmount());
                    billDTO.setInvoiceDate(bill.getInvoiceDate());
                    billDTO.setInvoiceNumber(bill.getInvoiceNumber());
                    return billDTO;
                })
                .filter(billDTO -> billDTO.getCategory()==category).collect(Collectors.toList());

        return bills;
    }

}

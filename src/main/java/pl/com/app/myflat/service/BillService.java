package pl.com.app.myflat.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.com.app.myflat.dto.BillDTO;
import pl.com.app.myflat.dto.RegisterUserDTO;
import pl.com.app.myflat.model.entities.Bill;
import pl.com.app.myflat.model.entities.User;
import pl.com.app.myflat.model.enums.Category;
import pl.com.app.myflat.model.repositories.BillRepository;
import pl.com.app.myflat.model.repositories.UserRepository;


import java.time.Instant;
import java.time.LocalDate;
import java.time.Month;
import java.time.ZoneId;
import java.util.*;
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

    public void payAllInvoices(Long id){
        List<Bill> bills = userRepository.findAllBillsToPayForUser(id)
                .stream().filter(bill->bill.getActive()==true).collect(Collectors.toList());
        for(Bill b : bills){
            b.setActive(false);
            billRepository.save(b);
        }
    }

    public void addObligatoryBills(RegisterUserDTO userDTO) {
        User byUsername = userRepository.findByUsername(userDTO.getUsername());

        LocalDate localDate = LocalDate.of(2020, Month.FEBRUARY, 2);
        Instant instant = localDate.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant();
        Date date = Date.from(instant);


        Bill billEarmarkedFeb = Bill.builder()
                .active(true)
                .category(Category.EARMARKED_FUND)
                .grossAmount((double) 35)
                .invoiceDate(date)
                .invoiceNumber("XY1234")
                .user(byUsername)
                .build();
        Bill billRepairFeb = Bill.builder()
                .active(true)
                .category(Category.REPAIR_FUND)
                .grossAmount((double) 21)
                .invoiceDate(date)
                .invoiceNumber("51631")
                .user(byUsername)
                .build();

        Bill billFixedFeb = Bill.builder()
                .active(true)
                .category(Category.CO_AND_CW_FIXED_FEE)
                .grossAmount((double) 45)
                .invoiceDate(date)
                .invoiceNumber("637235")
                .user(byUsername)
                .build();

        Bill billManagementFeb = Bill.builder()
                .active(true)
                .category(Category.MANAGEMENT_COSTS)
                .grossAmount((double) 12)
                .invoiceDate(date)
                .invoiceNumber("12667")
                .user(byUsername)
                .build();

        Bill billCentralFeb = Bill.builder()
                .active(true)
                .category(Category.CENTRAL_HEATING)
                .grossAmount((double) 17)
                .invoiceDate(date)
                .invoiceNumber("X23Y81234")
                .user(byUsername)
                .build();

        Bill billWasteFeb = Bill.builder()
                .active(true)
                .category(Category.WASTE_DISPOSAL)
                .grossAmount((double) 78)
                .invoiceDate(date)
                .invoiceNumber("GHF251")
                .user(byUsername)
                .build();

        Bill billHeatingFeb = Bill.builder()
                .active(true)
                .category(Category.WATER_HEATING)
                .grossAmount( 43.5)
                .invoiceDate(date)
                .invoiceNumber("CTR24")
                .user(byUsername)
                .build();

        Bill billSewageFeb = Bill.builder()
                .active(true)
                .category(Category.COLD_WATER_AND_SEWAGE)
                .grossAmount( 28.5)
                .invoiceDate(date)
                .invoiceNumber("777555")
                .user(byUsername)
                .build();

        Bill billEnergyFeb = Bill.builder()
                .active(true)
                .category(Category.ENERGY)
                .grossAmount((double) 106)
                .invoiceDate(date)
                .invoiceNumber("45")
                .user(byUsername)
                .build();

        billRepository.save(billEarmarkedFeb);
        billRepository.save(billRepairFeb);
        billRepository.save(billFixedFeb);
        billRepository.save(billManagementFeb);
        billRepository.save(billCentralFeb);
        billRepository.save(billWasteFeb);
        billRepository.save(billHeatingFeb);
        billRepository.save(billSewageFeb);
        billRepository.save(billEnergyFeb);

    }


}

package pl.com.app.myflat.dto;

import lombok.Data;
import pl.com.app.myflat.model.enums.Category;

import java.time.LocalDate;
import java.util.Date;

@Data
public class BillDTO {

    private Category category;
    private String invoiceNumber;
    private LocalDate invoiceDate;
    private Double grossAmount;
    private Boolean active = true;
}

package pl.com.app.myflat.dto;

import lombok.Data;
import pl.com.app.myflat.model.enums.Category;

import java.util.Date;

@Data
public class BillDTO {

    private Category category;
    private String invoiceNumber;
    private Date invoiceDate;
    private Integer grossAmount;
    private Boolean active = true;
}

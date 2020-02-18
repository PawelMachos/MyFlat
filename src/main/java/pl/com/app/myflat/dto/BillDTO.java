package pl.com.app.myflat.dto;

import lombok.Data;

import java.util.Date;

@Data
public class BillDTO {

    private String category;
    private String invoiceNumber;
    private Date invoiceDate;
    private Integer netto;
    private Integer vat;
    private Integer brutto;
    private String company;
    private Boolean active = true;
}

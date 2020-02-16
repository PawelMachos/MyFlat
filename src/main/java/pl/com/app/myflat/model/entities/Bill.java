package pl.com.app.myflat.model.entities;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Getter
@Setter
@ToString
@Table(name="bills")
public class Bill extends EntityBase {

    private String category;
    private String invoiceNumber;
    private Date invoiceDate;
  
}

package pl.com.app.myflat.model.entities;

import jdk.nashorn.internal.objects.annotations.Constructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.util.Date;

@Entity
@Getter
@Setter
@ToString
@Table(name="bills")
public class Bill extends EntityBase {

    public Bill() {
    }

    @Column
    private String category;
    @Column
    private String invoiceNumber;
    @Column
    private Date invoiceDate;
    @Column
    private Integer netto;
    @Column
    private Integer vat;
    @Column(nullable = false)
    private Integer brutto;
    @Column(nullable = false)
    private String company;
    @Column
    private Boolean active = true;

    @ManyToOne
    @JoinColumn(name="user_id", nullable = false)
    private User user;


}

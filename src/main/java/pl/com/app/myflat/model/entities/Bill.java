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

    @Column(nullable = false)
    private String category;
    @Column(nullable = false)
    private String invoiceNumber;
    @Column(nullable = false)
    private Date invoiceDate;
    @Column(nullable = false)
    private Integer netto;
    @Column(nullable = false)
    private Integer vat;
    @Column(nullable = false)
    private Integer brutto;
    @Column(nullable = false)
    private String company;
    @Column(nullable = false)
    private Boolean active = true;

    @ManyToOne
    @JoinColumn(name="user_id", nullable = false)
    private User user;


}

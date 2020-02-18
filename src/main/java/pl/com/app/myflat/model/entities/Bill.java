package pl.com.app.myflat.model.entities;

import jdk.nashorn.internal.objects.annotations.Constructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import pl.com.app.myflat.model.enums.Category;

import javax.persistence.*;
import java.util.Date;

@Entity
@Getter
@Setter
@ToString(exclude = {"user"})
@EqualsAndHashCode(of="id")
@Table(name="bills")
public class Bill extends EntityBase {


    @Enumerated(EnumType.STRING)
    private Category category;
    @Column(nullable = false)
    private String invoiceNumber;
    @Column(nullable = false)
    private Date invoiceDate;
    @Column(nullable = false)
    private Integer grossAmount;
    @Column(nullable = false)
    private Boolean active = true;
    @ManyToOne
    @JoinColumn(name="user_id", nullable = false)
    private User user;
}

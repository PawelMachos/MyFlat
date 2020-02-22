package pl.com.app.myflat.model.entities;


import lombok.*;
import pl.com.app.myflat.model.enums.Category;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Date;

@Getter @Setter @NoArgsConstructor
@AllArgsConstructor
@ToString (exclude = {"user"}) @EqualsAndHashCode (of = "id")
@Builder
@Entity
@Table(name="bills")
public class Bill extends EntityBase {


    @Enumerated(EnumType.STRING)
    private Category category;
    @Column(nullable = false)
    private String invoiceNumber;
    @Column(nullable = false)
    private Date invoiceDate;
    @Column(nullable = false)
    private Double grossAmount;
    @Column(nullable = false)
    private Boolean active = true;
    @ManyToOne
    @JoinColumn(name="user_id", nullable = false)
    private User user;
}

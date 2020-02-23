package pl.com.app.myflat.model.entities;

import lombok.*;
import org.springframework.web.bind.annotation.Mapping;

import javax.persistence.*;
import java.util.List;

@Getter @Setter @NoArgsConstructor
@AllArgsConstructor
@ToString @EqualsAndHashCode (of = "id")
@Builder
@Entity
@Table(name = "flats")
public class Flat extends EntityBase {

    @Column(nullable = false)
    private String flatNumber;
    @Column(nullable = false)
    private Boolean active;

    @OneToOne
    @JoinColumn(name="user_id", nullable = false)
    private User user;

//    @OneToMany(mappedBy = "flat")
//    private List<Bill> bills;


}

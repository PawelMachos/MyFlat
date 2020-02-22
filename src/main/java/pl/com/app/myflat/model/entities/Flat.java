package pl.com.app.myflat.model.entities;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.bind.annotation.Mapping;

import javax.persistence.*;

@Entity
@Getter
@Setter
@ToString(exclude = "user")
@EqualsAndHashCode

@Table(name = "flats")
public class Flat extends EntityBase {

    @Column(nullable = false)
    private String flatNumber;
    @Column(nullable = false)
    private Boolean active;

    @OneToOne
    @JoinColumn(name="user_id", nullable = false)
    private User user;


}

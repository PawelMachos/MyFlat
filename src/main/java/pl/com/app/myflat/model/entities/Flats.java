package pl.com.app.myflat.model.entities;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.bind.annotation.Mapping;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Getter
@Setter
@ToString
@EqualsAndHashCode

@Table(name = "flats")
public class Flats extends EntityBase {

    @Column(nullable = false)
    private String flatNumber;
    @Column(nullable = false)
    private Boolean active;


}

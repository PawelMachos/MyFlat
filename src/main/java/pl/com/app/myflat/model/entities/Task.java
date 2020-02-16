package pl.com.app.myflat.model.entities;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import java.util.HashSet;
import java.util.Set;

@Entity
@Getter
@Setter
@ToString(exclude ="users" )
@Table(name="tasks")
public class Task extends EntityBase{
    @Column(nullable = false)
    private String title;
    private String description;
    private Boolean active =true;

    @ManyToMany(mappedBy = "tasks")
    private Set<User> users = new HashSet<>();
}

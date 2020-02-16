package pl.com.app.myflat.model.entities;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Getter
@Setter
@ToString
@Table(name="tasks")
public class Task extends EntityBase{
    @Column(nullable = false)
    private String title;
    private String description;
    private Boolean active =true;


}

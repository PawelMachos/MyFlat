package pl.com.app.myflat.model.entities;


import lombok.*;

import javax.persistence.*;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Getter @Setter @AllArgsConstructor @NoArgsConstructor
@EqualsAndHashCode(of = "id") @ToString (exclude = {"password", "bills","flat","tasks"})
@Entity
@Table(name="users")
public class User extends EntityBase {


    @Column(unique = true, nullable = false)
    private String username;
    @Column(nullable = false)
    private String password;
    @Column(nullable = false)
    private String firstName;
    @Column(nullable = false)
    private String lastName;
    @Column(nullable = false)
    private String email;
    @Column(nullable = false)
    private String flatNumber;
    @Column(nullable = false)
    private String role;
    @Column
    Boolean active = false;

    @OneToMany(mappedBy = "user")
    private List<Bill> bills;

    @OneToOne(mappedBy = "user")
    private Flat flat;

    @OneToMany(mappedBy = "user")
    private List<Advert> advert;

//    @ManyToMany(cascade = {CascadeType.ALL})
//    @JoinTable(
//        name="users_tasks",
//            joinColumns = {@JoinColumn(name="user_id")},
//            inverseJoinColumns = {@JoinColumn(name="task_id")}
//    )
//    Set<Task> tasks = new HashSet<>();


}

package pl.com.app.myflat.model.entities;


import lombok.*;

import javax.persistence.*;
import java.util.List;

@Getter @Setter @AllArgsConstructor @NoArgsConstructor
@EqualsAndHashCode(of = "id") @ToString (exclude = {"password", "bills","flat","tasks"})
@Builder
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

    @OneToMany(mappedBy = "owner")
    private List<Task> tasks;

    @OneToOne(mappedBy = "user")
    private Flat flat;

    @OneToMany(mappedBy = "user")
    private List<Advert> advert;




}

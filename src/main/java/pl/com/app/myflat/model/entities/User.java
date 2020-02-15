package pl.com.app.myflat.model.entities;


import javax.persistence.*;

@Entity
@Table(name="users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;
    @Column
    String username;
    @Column
    String password;
    @Column
    String firstName;
    @Column
    String lastName;
    @Column
    String email;
    @Column
    String flatNumber;
    @Column
    String role;


    boolean active;

}

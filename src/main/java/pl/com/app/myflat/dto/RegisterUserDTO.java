package pl.com.app.myflat.dto;

import lombok.Data;
import pl.com.app.myflat.model.entities.Flat;


@Data
public class RegisterUserDTO {

    private String username;
    private String password;
    private String firstName;
    private String lastName;
    private String email;
//    private String flatNumbers;
    private Long flatNumber;
    private Flat flat;
}

package pl.com.app.myflat.dto;


import lombok.Data;

@Data
public class LoggedUserDTO {

    private Long id;
    private String username;
    private String password;
    private String firstName;
    private String lastName;
    private String email;
    private Long flatNumber;
}

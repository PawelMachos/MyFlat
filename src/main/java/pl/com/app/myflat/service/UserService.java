package pl.com.app.myflat.service;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import pl.com.app.myflat.dto.RegisterUserDTO;
import pl.com.app.myflat.model.entities.User;

@Service
public class UserService {

    private final PasswordEncoder passwordEncoder;

    public UserService(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    public User saveUser(RegisterUserDTO userDTO){

            String encodedPassword = passwordEncoder.encode(userDTO.getPassword());

            User user = new User();
            user.setUsername(userDTO.getUsername());
            user.setFirstName(userDTO.getFirstName());
            user.setLastName(userDTO.getLastName());
            user.setEmail(userDTO.getEmail());
            user.setFlatNumber(userDTO.getFlatNumber());
            user.setPassword(encodedPassword);
            user.setActive(true);
            user.setRole("USER");

            return user;

    }

}

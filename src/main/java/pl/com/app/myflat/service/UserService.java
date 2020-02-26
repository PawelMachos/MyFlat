package pl.com.app.myflat.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import pl.com.app.myflat.dto.LoggedUserDTO;
import pl.com.app.myflat.dto.RegisterUserDTO;
import pl.com.app.myflat.model.entities.User;
import pl.com.app.myflat.model.repositories.UserRepository;

@Service
public class UserService {

    private final PasswordEncoder passwordEncoder;
    private final UserRepository userRepository;

    public UserService(PasswordEncoder passwordEncoder, UserRepository userRepository) {
        this.passwordEncoder = passwordEncoder;
        this.userRepository = userRepository;
    }

    public void saveUser(RegisterUserDTO userDTO){

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
        userRepository.save(user);
    }

    public LoggedUserDTO getUser(String username){
        LoggedUserDTO loggedUserDTO = null;
        User user = userRepository.findByUsername(username);
        if(user!=null){
            loggedUserDTO = new LoggedUserDTO();
            loggedUserDTO.setFirstName(user.getFirstName());
            loggedUserDTO.setLastName(user.getLastName());
            loggedUserDTO.setId(user.getId());
            loggedUserDTO.setUsername(user.getUsername());

        }
        return loggedUserDTO;
    }


}
package pl.com.app.myflat.service;

import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    public UserService(PasswordEncoder passwordEncoder, UserRepository userRepository) {
        this.passwordEncoder = passwordEncoder;
        this.userRepository = userRepository;
    }

    public void saveUser(RegisterUserDTO userDTO) {

        String encodedPassword = passwordEncoder.encode(userDTO.getPassword());

        User user = new User();
        user.setUsername(userDTO.getUsername());
        user.setFirstName(userDTO.getFirstName());
        user.setLastName(userDTO.getLastName());
        user.setEmail(userDTO.getEmail());
        user.setPassword(encodedPassword);
        user.setActive(true);
        user.setRole("USER");
        user.setFlat(userDTO.getFlat());
        user.setFlatNumber((userDTO.getFlat()).getId());

//        User user = User.builder()
//                .username(userDTO.getUsername())
//                .firstName(userDTO.getFirstName())
//                .lastName(userDTO.getLastName())
//                .email(userDTO.getEmail())
//                .flatNumber(userDTO.getFlatNumber())
//                .password(encodedPassword)
//                .active(true)
//                .role("USER")
//                .build();
        userRepository.save(user);
    }

    public LoggedUserDTO getUser(String username) {
        LoggedUserDTO loggedUserDTO = null;
        User user = userRepository.findByUsername(username);
        if (user != null) {
            loggedUserDTO = new LoggedUserDTO();
            loggedUserDTO.setFirstName(user.getFirstName());
            loggedUserDTO.setLastName(user.getLastName());
            loggedUserDTO.setId(user.getId());
            loggedUserDTO.setUsername(user.getUsername());

        }
        return loggedUserDTO;
    }


}
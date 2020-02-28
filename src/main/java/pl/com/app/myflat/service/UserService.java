package pl.com.app.myflat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import pl.com.app.myflat.dto.LoggedUserDTO;
import pl.com.app.myflat.dto.RegisterUserDTO;
import pl.com.app.myflat.model.entities.User;
import pl.com.app.myflat.model.repositories.UserRepository;

import java.util.Optional;

@Service
public class UserService {

    private final PasswordEncoder passwordEncoder;
    private final UserRepository userRepository;
    private final TaskService taskService;

    @Autowired
    public UserService(PasswordEncoder passwordEncoder, UserRepository userRepository, TaskService taskService) {
        this.passwordEncoder = passwordEncoder;
        this.userRepository = userRepository;
        this.taskService = taskService;
    }

    public void saveUser(RegisterUserDTO userDTO) {

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

    }

    public LoggedUserDTO getUser(String username) {
        LoggedUserDTO loggedUserDTO = null;
        Optional <User> user = userRepository.findByUsername(username);
        if (user != null) {
            loggedUserDTO = new LoggedUserDTO();
            loggedUserDTO.setFirstName(user.get().getFirstName());
            loggedUserDTO.setLastName(user.get().getLastName());
            loggedUserDTO.setId(user.get().getId());
            loggedUserDTO.setUsername(user.get().getUsername());
        }
        return loggedUserDTO;
    }


}
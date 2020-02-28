package pl.com.app.myflat.controllers;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.com.app.myflat.dto.LoggedUserDTO;
import pl.com.app.myflat.dto.TaskDTO;
import pl.com.app.myflat.model.entities.Task;
import pl.com.app.myflat.model.entities.User;
import pl.com.app.myflat.model.repositories.UserRepository;
import pl.com.app.myflat.service.UserService;

import java.security.Principal;
import java.util.Optional;

@Controller
@RequestMapping("/user-profile")
@Slf4j
public class UserProfileController {

    private final UserRepository userRepository;
    private final UserService userService;

    @Autowired
    public UserProfileController(UserRepository userRepository, UserService userService) {
        this.userRepository = userRepository;
        this.userService = userService;
    }

    @GetMapping
    public String prepareEditUser(Principal principal, Model model) {
        String username = principal.getName();
        Optional<User> optionalUser = userRepository.findByUsername(username);
        if (optionalUser.isPresent()) {
            model.addAttribute("user", optionalUser.get());
            return "user-profile";
        }
        else {
            return "redirect:/home";
        }
    }

    @PostMapping
    public String processEditUser(LoggedUserDTO userDTO, Principal principal) {
        String username = principal.getName();

        Optional<User> optionalUser = userRepository.findByUsername(username);
        optionalUser.ifPresent(user -> {
            user.setFirstName(userDTO.getFirstName());
            user.setLastName(userDTO.getLastName());
            user.setUsername(userDTO.getUsername());
            user.setEmail(userDTO.getEmail());
            user.setPassword(userDTO.getPassword());
            userRepository.save(user);
        });


        return "redirect:/home";
    }


}

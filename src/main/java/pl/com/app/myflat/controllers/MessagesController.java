package pl.com.app.myflat.controllers;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.com.app.myflat.model.repositories.UserRepository;

@Controller
@Slf4j
@RequestMapping("/messages")
public class MessagesController {

    private final UserRepository userRepository;

    public MessagesController(final UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping
        public String prepareLoginPage() {
            return "messages";
        }
    }

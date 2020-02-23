package pl.com.app.myflat.controllers;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import pl.com.app.myflat.messenger.ClientGui;
import pl.com.app.myflat.model.entities.Message;
import pl.com.app.myflat.model.entities.User;
import pl.com.app.myflat.model.repositories.MessagesRepository;
import pl.com.app.myflat.model.repositories.UserRepository;

import java.security.Principal;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@Slf4j
public class MessagesController {

    private static final Logger log = org.slf4j.LoggerFactory.getLogger(MessagesController.class);

    private final UserRepository userRepository;
    private final MessagesRepository messagesRepository;

    public MessagesController(UserRepository userRepository, MessagesRepository messagesRepository) {
        this.userRepository = userRepository;
        this.messagesRepository = messagesRepository;
    }

    @PostMapping("/messages")
    public String addAdvert(String title, String message, String receiver, Principal principal) {
        String username = principal.getName();
        User user = userRepository.findByUsername(username);

        Message msg = new Message();
        msg.setTitle(title);
        msg.setMessage(message);
        msg.setReceiver(receiver);
        log.info("Próba zapisu wiadomości: " + msg);
        msg = messagesRepository.save(msg);
        log.info("Zapisano wiadomość: " + msg);

        return "redirect:/messages";
    }

    @Override
    public String toString() {
        return "MessagesController{" +
                "userRepository=" + userRepository +
                ", messagesRepository=" + messagesRepository +
                '}';
    }
}

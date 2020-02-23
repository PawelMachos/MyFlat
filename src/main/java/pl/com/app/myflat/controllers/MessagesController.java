package pl.com.app.myflat.controllers;

import lombok.extern.slf4j.Slf4j;
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

    private final UserRepository userRepository;
    private final MessagesRepository messagesRepository;
    private final ClientGui clientGui;

    public MessagesController(UserRepository userRepository, MessagesRepository messagesRepository, ClientGui clientGui) {
        this.userRepository = userRepository;
        this.messagesRepository = messagesRepository;
        this.clientGui = clientGui;
    }

    @GetMapping("/messages")
    public String showMessages(final Model model) {
        final List<Message> allMessages = this.messagesRepository.findAllByOrderByPostedDesc();
        model.addAttribute("adverts", allMessages);
        {
            return "messages";
        }
    }

    @PostMapping("/add-advert")
    public String addAdvert(final String owner, final String message, final Principal principal){
        final String userName = principal.getName();
        final User user = this.userRepository.findByUsername(userName);

        String message = new Message();
        message.setMessage(message);
        message.setUser(user);
        message.setCreatedAt(LocalDateTime.now());

        MessagesController.log.info("Nowa wiadomość: " + message);
        message = messagesRepository.save(message);
        MessagesController.log.info("Zapisana wiadomość: " + message);

        return "redirect:/messages";
    }
}

package pl.com.app.myflat.controllers;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import pl.com.app.myflat.model.entities.Advert;
import pl.com.app.myflat.model.entities.Comment;
import pl.com.app.myflat.model.entities.User;
import pl.com.app.myflat.model.repositories.AdvertRepository;
import pl.com.app.myflat.model.repositories.CommentRepository;
import pl.com.app.myflat.model.repositories.UserRepository;
import java.security.Principal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Controller
@Slf4j
public class AdvertPageController {

    private final UserRepository userRepository;
    private final AdvertRepository advertRepository;
    private final CommentRepository commentRepository;

    @Autowired
    public AdvertPageController(UserRepository userRepository, AdvertRepository advertRepository, CommentRepository commentRepository) {
        this.advertRepository = advertRepository;
        this.userRepository = userRepository;
        this.commentRepository = commentRepository;
    }

    @GetMapping("/adverts")
    public String showAdverts(Model model) {
        List<Advert> allAdverts = advertRepository.findAllBy();
        model.addAttribute("adverts", allAdverts);

        return "adverts-page";
    }

    @PostMapping("/add-advert")
    public String addAdvert(String title, String description, Principal principal) {
        String userName = principal.getName();
        User user = userRepository.findByUsername(userName);

        Advert advert = new Advert();
        advert.setTitle(title);
        advert.setDescription(description);
        advert.setUser(user);
        advert.setCreatedAt(LocalDateTime.now());
        advert.setActive(true);

        log.info("Próba zapisu ogłoszenia: " + advert);
        advert = advertRepository.save(advert);
        log.info("Zapisano ogłoszenie: " + advert);

        return "redirect:/adverts";
    }

    @PostMapping("/delete-advert")
    public String processDeleteAdvert(Long advertId, Principal principal) {
        String username = principal.getName();
        log.debug("Usuwanie ogłoszenia o id {} dla użytkownika {}", advertId, username);

        Optional<Advert> optionalAdvert = advertRepository.findByIdAndUserUsername(advertId, username);
        optionalAdvert.ifPresent(advertRepository::delete);

        return "redirect:/adverts";
    }

    @GetMapping("/edit-advert")
    public String prepareEditAdvert(Long advertId, Principal principal, Model model) {
        String username = principal.getName();
        Optional<Advert> optionalAdvert = advertRepository.findByIdAndUserUsername(advertId, username);

        if (optionalAdvert.isPresent()) {
            model.addAttribute("advert", optionalAdvert.get());
            return "/edit-advert-page";
        } else {
            return "redirect:/adverts";
        }
    }

    @PostMapping("/edit-advert")
    public String processEditAdvert(Long id, String title, String description, Principal principal) {
        String username = principal.getName();
        log.debug("Edycja ogłoszenia o id {} dla użytkownika {}", id, username);

        Optional<Advert> optionalAdvert = advertRepository.findByIdAndUserUsername(id, username);
        optionalAdvert.ifPresent(advert -> {
            advert.setTitle(title);
            advert.setDescription(description);
            advertRepository.save(advert);
        });

        return "redirect:/adverts";
    }

    @GetMapping("delete-comment")
    public String processDeleteComment(Long commentId, Principal principal) {
        String username = principal.getName();
        log.debug("Usuwanie komentarza o id {} od użytkownika {}", commentId, username);

        Optional<Comment> optionalAdvert = commentRepository.findByIdAndUserUsername(commentId, username);
        optionalAdvert.ifPresent(commentRepository::delete);

        return "redirect:/adverts";
    }

    @PostMapping("/add-comment")
    public String processAddComment(String commentText, Principal principal, Long advertId) {
        String userName = principal.getName();
        User user = userRepository.findByUsername(userName);

        Advert advert = advertRepository.getOne(advertId);

        Comment comment = new Comment();
        comment.setUser(user);
        comment.setCommentText(commentText);
        comment.setCreatedAt(LocalDateTime.now());
        comment.setAdvert(advert);
        comment.setActive(true);

        log.info("Próba zapisu ogłoszenia: " + comment);
        comment = commentRepository.save(comment);
        log.info("Zapisano ogłoszenie: " + comment);


        return "redirect:/adverts";
    }

    @GetMapping("/comments")
    public String showComments(Model model) {
        List<Comment> allComments = commentRepository.findAllBy();
        model.addAttribute("comments", allComments);

        return "redirect:/adverts";
    }

}

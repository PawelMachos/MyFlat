package pl.com.app.myflat.controllers;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import pl.com.app.myflat.model.entities.Advert;
import pl.com.app.myflat.model.entities.User;
import pl.com.app.myflat.model.repositories.AdvertRepository;
import pl.com.app.myflat.model.repositories.UserRepository;
import java.security.Principal;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@Slf4j
public class AdvertPageController {

    private final UserRepository userRepository;
    private final AdvertRepository advertRepository;

    @Autowired
    public AdvertPageController(UserRepository userRepository, AdvertRepository advertRepository) {
        this.advertRepository = advertRepository;
        this.userRepository = userRepository;
    }

    @GetMapping("/adverts")
    public String showAdverts(Model model){
        List<Advert> allAdverts = advertRepository.findAllBy();
        model.addAttribute("adverts", allAdverts);

        return "adverts-page";
    }

    @PostMapping("/add-advert")
    public String addAdvert(String title, String description, Principal principal){
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

}

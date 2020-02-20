package pl.com.app.myflat.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.com.app.myflat.model.entities.Advert;
import pl.com.app.myflat.model.repositories.AdvertRepository;

import java.util.List;

@Controller
@RequestMapping("/adverts")
public class AdvertPageController {

    private AdvertRepository advertRepository;

    public AdvertPageController(AdvertRepository advertRepository) {
        this.advertRepository = advertRepository;
    }

    @GetMapping
    public String showAdverts(Model model){
        List<Advert> allAdverts = advertRepository.findAllByCreatedDesc();
        model.addAttribute("adverts", allAdverts);

        return "adverts-page";
    }
}

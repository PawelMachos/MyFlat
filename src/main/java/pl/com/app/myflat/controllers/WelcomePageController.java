package pl.com.app.myflat.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.com.app.myflat.service.FlatService;

@Controller
@RequestMapping("/")
public class WelcomePageController {

    private final FlatService flatService;

    @Autowired
    public WelcomePageController(FlatService flatService) {
        this.flatService = flatService;
    }

    @GetMapping
    public String showWelcomePage() {
        return "welcome-page";
    }


    @ModelAttribute(name = "availableFlats", binding = false)
    public Integer availableFlats() {

       return flatService.howManyFlatsAreAvailable();
    }



}
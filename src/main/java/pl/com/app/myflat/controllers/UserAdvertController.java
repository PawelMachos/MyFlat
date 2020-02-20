package pl.com.app.myflat.controllers;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.com.app.myflat.model.repositories.AdvertRepository;
import pl.com.app.myflat.model.repositories.UserRepository;

@Controller
@RequestMapping("/adverts")
@Slf4j
public class UserAdvertController  {

    private UserRepository userRepository;
    private AdvertRepository advertRepository;

    @Autowired
    public UserAdvertController(UserRepository userRepository, AdvertRepository advertRepository) {
        this.userRepository = userRepository;
        this.advertRepository = advertRepository;
    }

    @GetMapping
    public String showAdverts(){ return "adverts-page";}
    
    }




package pl.com.app.myflat.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.com.app.myflat.dto.LoggedUserDTO;
import pl.com.app.myflat.model.entities.Advert;
import pl.com.app.myflat.model.repositories.AdvertRepository;
import pl.com.app.myflat.service.BillService;
import pl.com.app.myflat.service.UserService;

import java.awt.print.Pageable;
import java.security.Principal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/home")
public class HomePageController {

    private final BillService billService;
    private final UserService userService;
    private final AdvertRepository advertRepository;

    public HomePageController(BillService billService, UserService userService, AdvertRepository advertRepository) {
        this.billService = billService;
        this.userService = userService;
        this.advertRepository = advertRepository;
    }

    @GetMapping
    public String showHomePage(Model model, Principal principal) {
        LoggedUserDTO user = userService.getUser(principal.getName());
        model.addAttribute("billsToPay", billService.showAllBillsToPay(user.getId()));


        Advert newestAdvert = advertRepository.findTopByOrderByCreatedAtDesc();
        model.addAttribute("newestAdvert", newestAdvert);

        return "home-page";
    }


}
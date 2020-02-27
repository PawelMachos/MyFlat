package pl.com.app.myflat.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.com.app.myflat.dto.LoggedUserDTO;
import pl.com.app.myflat.model.entities.Advert;
import pl.com.app.myflat.model.repositories.AdvertRepository;
import pl.com.app.myflat.service.BillService;
import pl.com.app.myflat.service.TaskService;
import pl.com.app.myflat.service.UserService;

import java.security.Principal;

@Controller
@RequestMapping("/home")
public class HomePageController {

    private final BillService billService;
    private final UserService userService;
    private final AdvertRepository advertRepository;
    private final TaskService taskService;


    @Autowired
    public HomePageController(BillService billService, UserService userService, AdvertRepository advertRepository, TaskService taskService) {
        this.billService = billService;
        this.userService = userService;
        this.advertRepository = advertRepository;
        this.taskService = taskService;
    }

    @GetMapping
    public String showHomePage(Model model, Principal principal) {

        String username = principal.getName();
        LoggedUserDTO user = userService.getUser(username);

        model.addAttribute("billsToPay", billService.showAllBillsToPay(user.getId()));

        model.addAttribute("allTasks", taskService.showMostUrgentTasks(username));

        Advert newestAdvert = advertRepository.findTopByOrderByCreatedAtDesc();
        model.addAttribute("newestAdvert", newestAdvert);

        return "home-page";
    }


}
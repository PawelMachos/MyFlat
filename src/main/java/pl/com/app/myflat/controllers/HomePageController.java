package pl.com.app.myflat.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.com.app.myflat.dto.LoggedUserDTO;
import pl.com.app.myflat.model.entities.Advert;
import pl.com.app.myflat.model.entities.Task;
import pl.com.app.myflat.model.repositories.AdvertRepository;
import pl.com.app.myflat.model.repositories.TaskRepository;
import pl.com.app.myflat.service.BillService;
import pl.com.app.myflat.service.UserService;

import java.security.Principal;
import java.util.List;
import java.util.stream.Stream;

@Controller
@RequestMapping("/home")
public class HomePageController {

    private final BillService billService;
    private final UserService userService;
    private final AdvertRepository advertRepository;
    private final TaskRepository taskRepository;


    @Autowired
    public HomePageController(BillService billService, UserService userService, AdvertRepository advertRepository, TaskRepository taskRepository) {
        this.billService = billService;
        this.userService = userService;
        this.advertRepository = advertRepository;
        this.taskRepository = taskRepository;
    }

    @GetMapping
    public String showHomePage(Model model, Principal principal) {

        LoggedUserDTO user = userService.getUser(principal.getName());
        model.addAttribute("billsToPay", billService.showAllBillsToPay(user.getId()));


        Advert newestAdvert = advertRepository.findTopByOrderByCreatedAtDesc();
        model.addAttribute("newestAdvert", newestAdvert);

        List<Task> all = taskRepository.findFirst5ByOwnerUsernameOrderByCreatedAtDesc(principal.getName());

        model.addAttribute("allTasks", all);

        return "home-page";
    }


}
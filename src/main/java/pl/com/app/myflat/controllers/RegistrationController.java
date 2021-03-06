package pl.com.app.myflat.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import pl.com.app.myflat.dto.RegisterUserDTO;
import pl.com.app.myflat.model.entities.Flat;
import pl.com.app.myflat.service.BillService;
import pl.com.app.myflat.service.FlatService;
import pl.com.app.myflat.service.TaskService;
import pl.com.app.myflat.service.UserService;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/register")
public class RegistrationController {

    private final UserService userService;
    private final TaskService taskService;
    private final BillService billService;
    private final FlatService flatService;

    @Autowired
    public RegistrationController(UserService userService, TaskService taskService, BillService billService, FlatService flatService) {
        this.userService = userService;
        this.taskService = taskService;
        this.billService = billService;
        this.flatService = flatService;
    }

    @ModelAttribute(name = "flatNumbers", binding = false)
    public List<Long> flatNumbers() {

        List<Long> list = new ArrayList<>();

        List<Flat> availableFlats = flatService.showAllAvailableFlats();
        for (Flat f : availableFlats) {
            list.add(f.getFlatNumber());
        }
        return list;
    }


    @GetMapping
    public String prepareRegistrationPage() {
        return "register-form";
    }

    @PostMapping
    public String processRegistrationPage(RegisterUserDTO userDTO) {
        try {
            userService.saveUser(userDTO);
            taskService.addObligatoryTasks(userDTO);
            billService.addObligatoryBills(userDTO);
            flatService.assignUserToFlat(userDTO);

        } catch (RuntimeException d) {
            d.printStackTrace();
            return "redirect:/register";
        }
        return "login-page";
    }

}

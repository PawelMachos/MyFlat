package pl.com.app.myflat.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.com.app.myflat.dto.RegisterUserDTO;
import pl.com.app.myflat.service.BillService;
import pl.com.app.myflat.service.TaskService;
import pl.com.app.myflat.service.UserService;

import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/register")
public class RegistrationController {

    private final UserService userService;
    private final TaskService taskService;
    private final BillService billService;

    @Autowired
    public RegistrationController(UserService userService, TaskService taskService, BillService billService) {
        this.userService = userService;
        this.taskService = taskService;
        this.billService = billService;
    }

    @ModelAttribute(name = "flatNumbers", binding = false)
    public List<String> flatNumbers(){
        return Arrays.asList("1", "2", "3", "4", "5", "6", "7", "8", "9","10", "11");
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
        } catch (RuntimeException d){
            d.printStackTrace();
            return "redirect:/register";
        }
        return "login-page";
    }

}

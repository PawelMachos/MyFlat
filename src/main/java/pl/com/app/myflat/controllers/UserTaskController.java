package pl.com.app.myflat.controllers;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.com.app.myflat.dto.LoggedUserDTO;
import pl.com.app.myflat.model.entities.Task;
import pl.com.app.myflat.model.entities.User;
import pl.com.app.myflat.model.repositories.TaskRepository;
import pl.com.app.myflat.model.repositories.UserRepository;
import pl.com.app.myflat.service.TaskService;
import pl.com.app.myflat.service.UserService;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/user-tasks")
@Slf4j
public class UserTaskController {

    private final UserRepository userRepository;
    private final TaskRepository taskRepository;
    private final TaskService taskService;
    private final UserService userService;

    @Autowired
    public UserTaskController(UserRepository userRepository, TaskRepository taskRepository, TaskService taskService, UserService userService) {
        this.userRepository = userRepository;
        this.taskRepository = taskRepository;
        this.taskService = taskService;
        this.userService = userService;
    }


    @GetMapping
    public String prepareLoggedUserTasksPage(Model model, Principal principal) {
        String username = principal.getName();
        model.addAttribute("tasks", taskService.showAllLoggedUserTasks(username));

        return "organizer";
    }

    @GetMapping(params = "userId")
    public String prepareSelectedUserTasksPage(Long userId, Model model, Principal principal) {

        Optional<User> optionalUser = userRepository.findById(userId);
        User user = optionalUser.orElse(userRepository.findByUsername(principal.getName()));

        List<Task> userTasks = taskRepository.findAllByOwnerUsername(user.getUsername());

        model.addAttribute("tasks", userTasks);
        return "welcome-page";
    }












}

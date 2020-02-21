package pl.com.app.myflat.controllers;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.com.app.myflat.model.entities.Task;
import pl.com.app.myflat.model.entities.User;
import pl.com.app.myflat.model.repositories.TaskRepository;
import pl.com.app.myflat.model.repositories.UserRepository;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/user-tasks")
@Slf4j
public class UserTaskController {

    private final UserRepository userRepository;
    private final TaskRepository taskRepository;

    @Autowired
    public UserTaskController(UserRepository userRepository, TaskRepository taskRepository) {
        this.userRepository = userRepository;
        this.taskRepository = taskRepository;
    }


    @GetMapping
    public String prepareLoggedUserTasksPage(Model model, Principal principal) {
        String username = principal.getName();
        List<Task> userTasks = taskRepository.findAllByOwnerUsername(username);

        model.addAttribute("tasks", userTasks);
        return "organizer";
    }

    @GetMapping(params = "userId")
    public String prepareSelectedUserAdvertsPage(Long userId, Model model, Principal principal) {
        Optional<User> optionalUser = userRepository.findById(userId);
        User user = optionalUser.orElse(userRepository.findByUsername(principal.getName()));

        List<Task> userTasks = taskRepository.findAllByOwnerUsername(user.getUsername());

        model.addAttribute("tasks", userTasks);
        //return "/WEB-INF/views/home-page.jsp";
        return "welcome-page";
    }











}

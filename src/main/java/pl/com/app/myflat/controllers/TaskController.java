package pl.com.app.myflat.controllers;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.com.app.myflat.dto.TaskDTO;
import pl.com.app.myflat.model.entities.Task;
import pl.com.app.myflat.model.entities.User;
import pl.com.app.myflat.model.repositories.TaskRepository;
import pl.com.app.myflat.model.repositories.UserRepository;

import java.security.Principal;
import java.time.LocalDateTime;
import java.util.Optional;

@Controller
@Slf4j
public class TaskController {

    private final UserRepository userRepository;
    private final TaskRepository taskRepository;

    @Autowired
    public TaskController(UserRepository userRepository, TaskRepository taskRepository) {
        this.userRepository = userRepository;
        this.taskRepository = taskRepository;
    }

    @PostMapping("/add-task")
    public String processAddAdvert(String title, String description, Principal principal, @RequestParam(defaultValue = "/") String redirectTo) {
        String username = principal.getName();
        log.debug("Dodawanie ogłoszenia dla zalogowanego użytkownika: {}", username);

        User user = userRepository.findByUsername(username);
        log.debug("Zalogowany użytkownik: {}", user);

        Task task = new Task();
        task.setTitle(title);
        task.setDescription(description);
        task.setOwner(user);
        task.setCreatedAt(LocalDateTime.now());

        log.debug("Ogłoszenie do dodania: {}", task);
        taskRepository.save(task);
        log.debug("Zapisane ogłoszenie: {}", task);


        return "redirect:" + redirectTo;
    }

    @PostMapping("/delete-task")
    public String processDeleteAdvert(Long taskId, Principal principal) {
        String username = principal.getName();
        log.debug("Usuwanie ogłoszenia o id {} dla użytkownika {}", taskId, username);

        Optional<Task> optionalAdvert = taskRepository.findByIdAndOwnerUsername(taskId, username);
        optionalAdvert.ifPresent(taskRepository::delete);

        return "redirect:/user-tasks";
    }

    @GetMapping("/edit-task")
    public String prepageEditAdvert(Long taskId, Principal principal, Model model) {
        String username = principal.getName();
        Optional<Task> optionalTask = taskRepository.findByIdAndOwnerUsername(taskId, username);
        if (optionalTask.isPresent()) {
            model.addAttribute("task", optionalTask.get());
            return "organizer-edit";
        }
        else {
            return "redirect:/user-tasks";
        }
    }

    @PostMapping("/edit-task")
    public String processEditAdvert(Long id, String title, String description, Principal principal) {
        String username = principal.getName();
        log.debug("Edycja ogłoszenia o id {} dla użytkownika {}", id, username);

        Optional<Task> optionalTask = taskRepository.findByIdAndOwnerUsername(id, username);
        optionalTask.ifPresent(task -> {
            task.setTitle(title);
            task.setDescription(description);
            taskRepository.save(task);
        });

        return "redirect:/user-tasks";
    }
}
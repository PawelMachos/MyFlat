
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
import pl.com.app.myflat.model.enums.Status;
import pl.com.app.myflat.model.repositories.TaskRepository;
import pl.com.app.myflat.service.TaskService;

import java.security.Principal;
import java.util.Optional;

@Controller
@Slf4j
public class TaskController {

    private final TaskRepository taskRepository;
    private final TaskService taskService;

    @Autowired
    public TaskController(TaskRepository taskRepository, TaskService taskService) {
        this.taskRepository = taskRepository;
        this.taskService = taskService;
    }

    @PostMapping("/add-task")
    public String processAddTask(TaskDTO taskDTO, Principal principal, @RequestParam(defaultValue = "/") String redirectTo) {

        taskService.saveTask(taskDTO, principal);

        return "redirect:" + redirectTo;
    }

    @PostMapping("/delete-task")
    public String processDeleteTask(Long taskId, Principal principal) {
        String username = principal.getName();

        Optional<Task> optionalTask = taskRepository.findByIdAndOwnerUsername(taskId, username);
        optionalTask.ifPresent(taskRepository::delete);

        return "redirect:/user-tasks";
    }


    @GetMapping("/edit-task")
    public String prepareEditTask(Long taskId, Principal principal, Model model) {
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
    public String processEditTask(Long id, TaskDTO taskDTO, Principal principal) {
        String username = principal.getName();

        Optional<Task> optionalTask = taskRepository.findByIdAndOwnerUsername(id, username);
        optionalTask.ifPresent(task -> {
            task.setTitle(taskDTO.getTitle());
            task.setDescription(taskDTO.getDescription());
            taskRepository.save(task);
        });

        return "redirect:/user-tasks";
    }

    @GetMapping("/checked-task")
    public String prepareCheckedTask(Long taskId, Principal principal, Model model) {
        String username = principal.getName();
        Optional<Task> optionalTask = taskRepository.findByIdAndOwnerUsername(taskId, username);
        if (optionalTask.isPresent()) {
            model.addAttribute("task", optionalTask.get());
            return "organizer-checked";
        }
        else {
            return "redirect:/user-tasks";
        }
    }

    @PostMapping("/checked-task")
    public String processCheckedTask(Long id,Principal principal) {
        String username = principal.getName();

        Optional<Task> optionalTask = taskRepository.findByIdAndOwnerUsername(id, username);
        optionalTask.ifPresent(task -> {
            task.setActive(false);
            task.setStatus(Status.INACTIVE.toString());
            taskRepository.save(task);
        });

        return "redirect:/user-tasks";
    }

}
package pl.com.app.myflat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.com.app.myflat.dto.TaskDTO;
import pl.com.app.myflat.model.entities.Task;
import pl.com.app.myflat.model.entities.User;
import pl.com.app.myflat.model.enums.Status;
import pl.com.app.myflat.model.repositories.TaskRepository;
import pl.com.app.myflat.model.repositories.UserRepository;

import java.security.Principal;
import java.time.LocalDate;
import java.util.List;


@Service
public class TaskService {

    private final TaskRepository taskRepository;
    private final UserRepository userRepository;

    @Autowired
    public TaskService(TaskRepository taskRepository, UserRepository userRepository) {
        this.taskRepository = taskRepository;
        this.userRepository = userRepository;
    }

    public void saveTask(TaskDTO taskDTO, Principal principal) {

        String username = principal.getName();
        User user = userRepository.findByUsername(username);

        Task task = Task.builder()
                .title(taskDTO.getTitle())
                .description(taskDTO.getDescription())
                .active(taskDTO.getActive())
                .status((Status.ACTIVE).toString())
                .startDate(LocalDate.now().plusDays(1))
                .deadline(LocalDate.now().plusDays(8))
                .owner(user)
                .build();

        taskRepository.save(task);
    }

    public List <Task> showAllLoggedUserTasks(String username){
        return taskRepository.findAllByOwnerUsername(username);
    }


    public List <Task> showMostUrgentTasks(String username) {
        return taskRepository.findTasksByStatusAndOwnerUsernameOrderByDeadlineAsc(Status.ACTIVE.toString(), username);
    }


}

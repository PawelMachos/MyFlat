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

@Service
public class TaskService {

    private final TaskRepository taskRepository;
    private final UserRepository userRepository;

    @Autowired
    public TaskService(TaskRepository taskRepository, UserRepository userRepository) {
        this.taskRepository = taskRepository;
        this.userRepository = userRepository;
    }


    public void saveTask(TaskDTO taskDTO, Principal principal){

        String username = principal.getName();

        User user = userRepository.findByUsername(username);

        Task task = new Task();
        task.setTitle(taskDTO.getTitle());
        task.setDescription(taskDTO.getDescription());
        task.setActive(taskDTO.getActive());
        task.setStatus((Status.ACTIVE).toString());
        task.setStartDate(LocalDate.now());
        task.setDeadline((LocalDate.now()).plusDays(7));
        task.setOwner(user);
        taskRepository.save(task);
    }

    public Task taskForNewUser(Principal principal){

        String username = principal.getName();
        User user = userRepository.findByUsername(username);

        Task task = Task.builder()
                .title("Odbierz klucze")
                .description("W ciągu pierwszych 7 dni odbierz klucze do głównego kubła")
                .active(true)
                .status((Status.ACTIVE).toString())
                .startDate(LocalDate.now())
                .deadline(LocalDate.now().plusDays(7))
                .owner(user)
                .build();

                return task;
    }


}

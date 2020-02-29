package pl.com.app.myflat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.com.app.myflat.dto.RegisterUserDTO;
import pl.com.app.myflat.dto.TaskDTO;
import pl.com.app.myflat.model.entities.Task;
import pl.com.app.myflat.model.entities.User;
import pl.com.app.myflat.model.enums.Status;
import pl.com.app.myflat.model.repositories.TaskRepository;
import pl.com.app.myflat.model.repositories.UserRepository;

import java.security.Principal;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;


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
        Optional<User> optionalUser = userRepository.findByUsername(username);



        Task task = Task.builder()
                .title(taskDTO.getTitle())
                .description(taskDTO.getDescription())
                .active(taskDTO.getActive())
                .status((Status.ACTIVE).toString())
                .startDate(LocalDate.now().plusDays(1))
                .deadline(LocalDate.now().plusDays(8))
                .owner(optionalUser.get())
                .build();

        taskRepository.save(task);
    }

    public List <Task> showAllLoggedUserTasks(String username){
        return taskRepository.findAllByOwnerUsername(username);
    }


    public List <Task> showMostUrgentTasks(String username) {
        return taskRepository.findFirst4TasksByStatusAndOwnerUsernameOrderByDeadlineAsc(Status.ACTIVE.toString(), username);
    }


    public void addObligatoryTasks(RegisterUserDTO userDTO) {
       Optional<User> optionalUser = userRepository.findByUsername(userDTO.getUsername());

        Task task1 = Task.builder()
                .title("Odbierz klucze")
                .description("W ciągu 10 dni odbierz klucze go głównego kontenera na śmieci")
                .active(true)
                .status((Status.ACTIVE).toString())
                .startDate(LocalDate.now())
                .deadline(LocalDate.now().plusDays(10))
                .owner(optionalUser.get())
                .build();

        Task task2 = Task.builder()
                .title("Zgłoś odbiór instalacji")
                .description("Masz tydzień na zgłoszenie odbioru technicznego instalacji wodnej i energetyczne w mieszkaniu")
                .active(true)
                .status((Status.ACTIVE).toString())
                .startDate(LocalDate.now())
                .deadline(LocalDate.now().plusDays(7))
                .owner(optionalUser.get())
                .build();

        Task task3 = Task.builder()
                .title("Opłać kaucję")
                .description("Opłać kaucję w wysokości trzykrotności czynszu w ciągu 30 dni od zarejestrowania w aplikacji myFlat")
                .active(true)
                .status((Status.ACTIVE).toString())
                .startDate(LocalDate.now())
                .deadline(LocalDate.now().plusDays(30))
                .owner(optionalUser.get())
                .build();

        Task task4 = Task.builder()
                .title("Sprawdź skrzynkę e-mail")
                .description("Wszystkie dokumenty zwiazane z wynajmem mieszkania zostaną wysłane do Ciebie drogą mailową. Prosze potwierdź ich otrzymanie za pomocą platformy autenti.com")
                .active(true)
                .status((Status.ACTIVE).toString())
                .startDate(LocalDate.now())
                .deadline(LocalDate.now().plusDays(7))
                .owner(optionalUser.get())
                .build();

        Task task5 = Task.builder()
                .title("Przywitaj się")
                .description("Zarejestruj się na osiedlowym forum naszaosiedle.org i przywitaj się z sąsiadami")
                .active(true)
                .status((Status.ACTIVE).toString())
                .startDate(LocalDate.now())
                .deadline(LocalDate.now().plusDays(14))
                .owner(optionalUser.get())
                .build();

        taskRepository.save(task1);
        taskRepository.save(task2);
        taskRepository.save(task3);
        taskRepository.save(task4);
        taskRepository.save(task5);
    }
}

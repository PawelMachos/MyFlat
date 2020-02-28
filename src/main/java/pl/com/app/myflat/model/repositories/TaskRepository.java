package pl.com.app.myflat.model.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.com.app.myflat.model.entities.Task;

import java.util.List;
import java.util.Optional;

public interface TaskRepository extends JpaRepository<Task, Long> {


    Optional<Task> findByIdAndOwnerUsername(Long taskId, String username);
    List<Task> findAllByOwnerUsername(String username);
    List<Task> findFirst5ByOwnerUsernameOrderByDeadlineAsc(String username);
    List <Task> findFirst4TasksByStatusAndOwnerUsernameOrderByDeadlineAsc(String status,String username);


}

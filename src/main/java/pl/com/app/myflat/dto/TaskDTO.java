package pl.com.app.myflat.dto;

import lombok.Data;
import pl.com.app.myflat.model.entities.User;

import java.time.LocalDate;

@Data
public class TaskDTO {

    private Long id;
    private String title;
    private String description;
    private Boolean active = true;
    private LocalDate startDate;
    private LocalDate deadline;
    private User owner;
}

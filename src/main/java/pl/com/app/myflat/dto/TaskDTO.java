package pl.com.app.myflat.dto;

import lombok.Data;
import pl.com.app.myflat.model.entities.User;

@Data
public class TaskDTO {

    private Long id;
    private String title;
    private String description;
    private Boolean active = true;
    private User owner;
}

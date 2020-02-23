package pl.com.app.myflat.dto;

import lombok.Data;
import pl.com.app.myflat.model.entities.User;

@Data
public class MessagesDTO {

    private Long id;
    private String message;
    private User receiver;
}

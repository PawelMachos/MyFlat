package pl.com.app.myflat.model.entities;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

@Entity
@Getter
@Setter
@ToString
@EqualsAndHashCode
@Table(name = "messages")
public class Message extends EntityBase {

    @Column(nullable = false)
    private String title;

    @Column(nullable = false)
    private String receiver;

    @ManyToOne
    @JoinColumn(name="user_id", nullable = false)
    private User user;
}
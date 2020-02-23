package pl.com.app.myflat.model.entities;

import jdk.nashorn.internal.objects.annotations.Constructor;
import lombok.*;

import javax.persistence.*;

@Getter @Setter @NoArgsConstructor
@AllArgsConstructor
@ToString @EqualsAndHashCode (of = "id")
@Builder
@Entity
@Table(name = "messages")
public class Message extends EntityBase {

    @Column(nullable = false)
    private String receiver;

    @Column(nullable = false)
    private String message;

    @ManyToOne
    @JoinColumn(name="user_id", nullable = false)
    private User user;

    public void setTitle(String title) {
    }

    public void setReceiver(String receiver) {
    }
}

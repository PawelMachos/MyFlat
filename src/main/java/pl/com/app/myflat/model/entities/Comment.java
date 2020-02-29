package pl.com.app.myflat.model.entities;

import lombok.*;

import javax.persistence.*;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString (exclude = {"user"}) @EqualsAndHashCode (of = "id")
@Builder
@Entity
@Table(name = "comments")
public class Comment extends EntityBase{

//    @Column(nullable = false)
//    private LocalDateTime createdAt;
    @Column(nullable = false)
    private String commentText;
    @Column(nullable = false)
    private Boolean active;

    @ManyToOne
    private Advert advert;

    @ManyToOne
    @JoinColumn(name="user_id", nullable = false)
    private User user;
}

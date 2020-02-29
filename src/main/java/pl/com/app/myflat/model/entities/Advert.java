package pl.com.app.myflat.model.entities;

import lombok.*;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Getter @Setter @NoArgsConstructor
@AllArgsConstructor
@ToString (exclude = {"user"}) @EqualsAndHashCode (of = "id")
@Builder
@Entity
@Table(name = "adverts")
public class Advert extends EntityBase{

    @Column(nullable = false)
    private String title;
    @Column(nullable = false)
    private String description;
    @Column(nullable = false)
    private Boolean active;
    @Column
    private LocalDateTime createdAt;

    /*@OneToMany(mappedBy = "advert")
    private List<Comment> comments;*/

    @ManyToOne
    @JoinColumn(name="user_id", nullable = false)
    private User user;
}

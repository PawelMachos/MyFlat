package pl.com.app.myflat.model.entities;

import lombok.*;
import pl.com.app.myflat.model.enums.Status;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor
@ToString @EqualsAndHashCode (of = "id")
@Builder
@Entity
@Table (name = "tasks")
public class Task extends EntityBase{

    @Column(nullable = false)
    private String title;

    @Column(columnDefinition = "TEXT")
    private String description;

    private Boolean active;
    private String status;
    private LocalDate startDate;
    private LocalDate deadline;

    @ManyToOne
    @JoinColumn(name = "owner_id")
    private User owner;

    @Column(name = "owner_id", insertable = false, updatable = false)
    private Long ownerId;

}

package pl.com.app.myflat.model.entities;


import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Date;

@MappedSuperclass
public class EntityBase  {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, updatable = false, nullable = false)
    private Long id;

    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    @PreUpdate
    protected void preUpdate() {
        this.updatedAt = LocalDateTime.now();
    }

    @PrePersist
    protected void prePersist() {
        this.createdAt = LocalDateTime.now();
    }

}


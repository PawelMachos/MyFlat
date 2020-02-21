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
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;

    @Column(name = "updated_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedAt;

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    @PreUpdate
    protected void preUpdate() {
        this.updatedAt = new Date();
    }

    @PrePersist
    protected void prePersist() {
        this.createdAt = new Date();
    }

}


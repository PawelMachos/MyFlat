package pl.com.app.myflat.model.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.com.app.myflat.model.entities.Comment;

import java.util.List;
import java.util.Optional;

public interface CommentRepository extends JpaRepository<Comment, Long> {

    Optional<Comment> findByIdAndUserUsername(Long commentId, String userName);

    List<Comment> findAllBy();

    //List<Comment> findAllByAdvertId(Long advertId);
}

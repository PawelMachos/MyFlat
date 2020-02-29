package pl.com.app.myflat.service;

import org.springframework.stereotype.Service;
import pl.com.app.myflat.model.repositories.AdvertRepository;
import pl.com.app.myflat.model.repositories.CommentRepository;
import pl.com.app.myflat.model.repositories.UserRepository;

@Service
public class CommentService {

    private final UserRepository userRepository;
    private final AdvertRepository advertRepository;
    private final CommentRepository commentRepository;


    public CommentService(UserRepository userRepository, AdvertRepository advertRepository, CommentRepository commentRepository) {
        this.userRepository = userRepository;
        this.advertRepository = advertRepository;
        this.commentRepository = commentRepository;
    }


}

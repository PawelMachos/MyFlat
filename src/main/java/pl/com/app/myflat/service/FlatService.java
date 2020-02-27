package pl.com.app.myflat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.com.app.myflat.dto.RegisterUserDTO;
import pl.com.app.myflat.model.entities.Flat;
import pl.com.app.myflat.model.entities.User;
import pl.com.app.myflat.model.repositories.FlatRepository;
import pl.com.app.myflat.model.repositories.UserRepository;

import java.util.List;

@Service
public class FlatService {

    private final FlatRepository flatRepository;
    private final UserRepository userRepository;

    @Autowired
    public FlatService(FlatRepository flatRepository, UserRepository userRepository) {
        this.flatRepository = flatRepository;
        this.userRepository = userRepository;
    }


    public List<Flat> showAllAvailableFlats() {
        return flatRepository.findAll();
    }

    public void assignUserToFlat(RegisterUserDTO userDTO) {

        String username = userDTO.getUsername();
        User user = userRepository.findByUsername(username);

        Long userId = user.getId();

        Long flatNumber = userDTO.getFlatNumber();
        Flat byFlatNumber = flatRepository.findByFlatNumber(flatNumber);
        byFlatNumber.setUserId(userId);
        flatRepository.save(byFlatNumber);

    }
}

package pl.com.app.myflat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.com.app.myflat.dto.RegisterUserDTO;
import pl.com.app.myflat.model.entities.Flat;
import pl.com.app.myflat.model.enums.Status;
import pl.com.app.myflat.model.repositories.FlatRepository;

import java.util.List;

@Service
public class FlatService {

    private final FlatRepository flatRepository;

    @Autowired
    public FlatService(FlatRepository flatRepository) {
        this.flatRepository = flatRepository;
    }

    public List<Flat> showAllAvailableFlats() {
        return flatRepository.findAll();
    }

    public void assignFlatToUser(RegisterUserDTO userDTO) {
        Flat flat = userDTO.getFlat();

       flatRepository.save(flat);

    }
}

package com.Rpg.service;

import com.Rpg.dto.LocationDTO;
import com.Rpg.entity.Location;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface LocationService {

    void create(LocationDTO locationDTO, MultipartFile multipartFile) throws IOException;

    LocationDTO getByName(String name);

    List<LocationDTO> getAll();

    void deleteByName(String name);

    Location get(String name);

    void updateName(String name, String updateName);

    void updateImage(String name, MultipartFile multipartFile) throws IOException;
}

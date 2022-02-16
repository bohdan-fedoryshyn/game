package com.Rpg.service;

import com.Rpg.dto.LocationDTO;
import com.Rpg.entity.Location;
import com.Rpg.repository.LocationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.io.IOException;
import java.util.*;

@Service
public class LocationServiceImplement implements LocationService {

    @Value("${locations}")
    private String locationsPath;

    private LocationRepository locationRepository;

    private ImageService imageService;

    @Autowired
    public LocationServiceImplement(LocationRepository locationRepository, ImageService imageService) {
        this.locationRepository = locationRepository;
        this.imageService = imageService;
    }

    private Location map(LocationDTO locationDTO) {
        Location location = new Location();
        location.setName(locationDTO.getName());
        location.setMonsters(locationDTO.getMonsters());
        location.setImage(locationDTO.getImage());
        return location;
    }

    private LocationDTO map(Location location) {
        LocationDTO locationDTO = new LocationDTO();
        locationDTO.setName(location.getName());
        locationDTO.setMonsters(location.getMonsters());
        locationDTO.setImage(location.getImage());
        return locationDTO;
    }

    private List<LocationDTO> map(List<Location> locations) {
        List<LocationDTO> locationDTOS = new ArrayList<>();
        for (Location location : locations) {
            locationDTOS.add(map(location));
        }
        return locationDTOS;
    }

    @Override
    public void create(LocationDTO locationDTO, MultipartFile multipartFile) throws IOException {
        Location location = map(locationDTO);
        String resultFileName = imageService.saveFile(locationsPath, multipartFile);
        location.setImage(resultFileName);
        save(location);
    }

    private void save(Location location) {
        locationRepository.save(location);
    }

    @Override
    public LocationDTO getByName(String name) {
        return map(findOne(name));
    }

    private Location findOne(String name) {
        return locationRepository.findByName(name);
    }

    @Override
    public List<LocationDTO> getAll() {
        return map(findAll());
    }

    private List<Location> findAll() {
        return locationRepository.findAll();
    }

    @Override
    @Transactional
    public void deleteByName(String name) {
        if (imageService.deleteFile(locationsPath, findOne(name).getImage()))
            locationRepository.deleteByName(name);
    }

    @Override
    public Location get(String name) {
        return findOne(name);
    }

    @Override
    public void updateName(String name, String updateName) {
        Location location = findOne(name);
        location.setName(updateName);
        save(location);
    }

    @Override
    public void updateImage(String name, MultipartFile multipartFile) throws IOException {
        Location location = findOne(name);
        if (location.getImage() != null)
            imageService.deleteFile(locationsPath, location.getImage());
        location.setImage(imageService.saveFile(locationsPath, multipartFile));
        save(location);
    }

//    private void saveFile(Location location, MultipartFile multipartFile) throws IOException {
//
//        String uuid = UUID.randomUUID().toString();
//        String resultFileName = uuid + "." + multipartFile.getOriginalFilename();
//        location.setImage(resultFileName);
////        String forFile = filePath + locationsPath+ "/" + resultFileName;
//        File file = new File(forFile);
//        multipartFile.transferTo(file);
//    }


    //    @Override
//    public void locationFight(LocationDto locationDto, HeroDto heroDto, HeroService heroService) {
//        Scanner scanner = new Scanner(System.in);
//        for (MonsterDto monsterDto : locationDto.getMonsters()) {
//            heroService.show(monsterDto, heroDto);
//            Boolean a = true;
//            while (monsterDto.getMonsterHP() >= 0 && heroDto.getUserHP() > 0 && a) {
//                heroService.choose();
//                switch (scanner.nextInt()) {
//                    case 1:
//                        heroService.kick(user, monsterDto);
//                        heroService.show(monsterDto, heroDto);
//                        if (heroDto.getUserHP() <= 0)
//                            System.out.println("I kill you " + monsterDto.getMonsterName());
//                        break;
//                    case 2:
//                        if (heroDto.getUserHP() < 100) {
//                            heroService.heal(heroDto);
//                            heroService.show(monsterDto, heroDto);
//                            break;
//                        } else {
//                            System.out.println("Ви не можете збільшувати HP");
//                            break;
//                        }
//                    case 3:
//                        a = false;
//                        break;
//
//                }
//            }

//        }
//    }


//    @Override
//    public void addLocation(String name) {
//        Location location = new Location(name);
//        if(locationRepository.countByName(name) > 0) throw new LocationExistException("Location with this name:" + name+ "already exist");
//        save(location);
//    }
}


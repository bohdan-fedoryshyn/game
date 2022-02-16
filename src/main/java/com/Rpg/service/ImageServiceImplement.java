package com.Rpg.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service
public class ImageServiceImplement implements ImageService {

    @Value("${file.path}")
    private String filePath;

    @Override
    public String saveFile(String path, MultipartFile multipartFile) throws IOException {
        if(multipartFile != null){
            File dir = new File(filePath + path);
            if(!dir.exists()){
                dir.mkdir();
            }

            String uuid = UUID.randomUUID().toString();
            String resultFileName = uuid + "." + multipartFile.getOriginalFilename();
            String forImage = filePath + path + "/" + resultFileName;
            File file = new File(forImage);
            multipartFile.transferTo(file);
            return resultFileName;
        }

        return null;
    }

    @Override
    public boolean deleteFile(String path, String fileName) {
        File file = new File(filePath + path + "/", fileName);
        return file.delete();
    }

}

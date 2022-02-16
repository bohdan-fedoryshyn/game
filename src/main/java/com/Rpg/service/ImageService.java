package com.Rpg.service;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface ImageService {

    String saveFile(String path, MultipartFile multipartFile) throws IOException;

    boolean deleteFile(String path, String fileName);
}

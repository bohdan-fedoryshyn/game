package com.Rpg.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfig implements WebMvcConfigurer {

    @Value("${file.path}")
    private String filePath;

    @Value("${locations}")
    private String locationsPath;

    @Value("${characters}")
    private String charactersPath;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/images/**")
                .addResourceLocations("file:/" + filePath + "/");
        registry.addResourceHandler("/images/locations/**")
                .addResourceLocations("file:/" + filePath + locationsPath + "/");
        registry.addResourceHandler("/images/characters/**")
                .addResourceLocations("file:/" + filePath + charactersPath + "/");
    }


}

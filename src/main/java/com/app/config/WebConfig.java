package com.app.config;

import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**")
                .addResourceLocations("file:///C:/tmp/resources/");
    }
    
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Integer.class, new CustomNumberEditor(Integer.class, true) {
            @Override
            public void setAsText(String text) throws IllegalArgumentException {
                // 쉼표 제거
                String value = text.replace(",", "");
                // 기본 구현을 사용하여 숫자로 변환
                super.setAsText(value);
            }
        });
    }
}
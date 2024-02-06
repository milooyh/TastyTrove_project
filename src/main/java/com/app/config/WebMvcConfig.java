package com.app.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@EnableWebMvc
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		System.out.println("addResourceHandlers 실행");
		registry.addResourceHandler("/fileStorage/**")
		.addResourceLocations("file:///D:/fileStorage/");
	}
	
	
}

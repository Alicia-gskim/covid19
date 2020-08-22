package com.hanium.covid19.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
public class WebConfig implements WebMvcConfigurer {
	
	private static final String[] CLASS_PATH_RESOURCE_LOCATIONS = {
			"classpath:/resources/", "classpath:/static/"
	};
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/**").addResourceLocations(CLASS_PATH_RESOURCE_LOCATIONS);
//		.addResourceLocations("/resources/")
//		.addResourceLocations("/resources/static/")
//		.addResourceLocations("/resources);
		
		WebMvcConfigurer.super.addResourceHandlers(registry);
	}
	
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		resolver.setViewClass(JstlView.class);
		
		registry.viewResolver(resolver);
		
		WebMvcConfigurer.super.configureViewResolvers(registry);
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoggerInterceptor())
		.addPathPatterns("/**")
		.excludePathPatterns("/js/**", "/css/**", "/fonts/**");
		
		WebMvcConfigurer.super.addInterceptors(registry);
	}
}

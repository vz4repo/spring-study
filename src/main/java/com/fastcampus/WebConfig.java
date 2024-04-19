package com.fastcampus;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

  @Bean
  public LoginInterceptor loginInterceptor() {
    return new LoginInterceptor();
  }
  @Override
  public void addInterceptors(InterceptorRegistry registry) {
    registry.addInterceptor(new LoginInterceptor())
        .addPathPatterns("/**")   // 모든 경로에 적용
        .excludePathPatterns("/login","/welcome","index");    // 제외 경로 추가
  }
}

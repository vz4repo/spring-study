package com.fastcampus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sound.midi.Soundbank;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
      throws Exception {
    System.out.println("[ preHandle ]");
    HttpSession session = request.getSession();
    String loginFlag = (String)session.getAttribute("sid");
    if (loginFlag == null || loginFlag.isEmpty() ){
      System.out.println("flag : "+loginFlag);
      response.sendRedirect("/login");
      return false;   // 컨트롤러 핸들러로 요청 전달하지 않음
    }
    System.out.println("Flag!" + loginFlag);
    return true;      // 컨트롤러 핸들러로 요청 전달
  }

  @Override
  public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
      ModelAndView modelAndView) throws Exception {
    // 요청 처리 후 수행
  }

  @Override
  public void afterCompletion(HttpServletRequest request, HttpServletResponse response,
      Object handler, Exception ex) throws Exception {
    // 요청 처리 완료 후  수행
  }
}

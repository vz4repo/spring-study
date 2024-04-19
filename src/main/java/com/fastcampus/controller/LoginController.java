package com.fastcampus.controller;

import com.fastcampus.repository.UserDao;
import com.fastcampus.repository.UserDto;
import java.io.IOException;
import java.util.Arrays;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {
  @Autowired
  UserDao userDao;

  /* GET :: 로그인 */
  @GetMapping("login")
  public String loginForm() {
    System.out.println("[ loginForm ]");
    return "login";
  }

  /* GET :: 로그아웃 */
  @GetMapping("logout")
  public String logout(HttpServletRequest request, HttpServletResponse response)
      throws IOException {
    System.out.println("[ logout ]");

    HttpSession session = request.getSession(false);

    // cookieRemember가 존재하지 않는 경우 : cookieID
    if (Arrays.stream(request.getCookies()).noneMatch(cookie -> "remember".equals(cookie.getName()))) {
      Arrays.stream(request.getCookies())
          .filter(idCookie -> "id".equals(idCookie.getName()))
          .forEach(idCookie -> {
            idCookie.setMaxAge(0);
            response.addCookie(idCookie);
          });
    }

    // String 으로 해야하나 void로 해야하나
    // 로그아웃 시간 DB에 저장
    userDao.updatePrevDate(String.valueOf((session.getAttribute("sid"))));

    // 세션 비활성
    session.invalidate();

    return "redirect:/";
  }

  @PostMapping("login")
  public String login(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
    System.out.println("[ login ]");

    // 1. form을 통해서 받은 "id", "pw", "remember", "url"
    String id = request.getParameter("id").trim();
    String pw = request.getParameter("pw").trim();
    String remember = request.getParameter("remember");  // ID 기억하기 체크박스
    String url = request.getParameter("url");            // 첫 요청 URL
    String clientIP = request.getRemoteAddr();                 // 클라이언트의 IP 주소

    // 2. 로그인 성공여부에 따른 분기
    if (userDao.validateUser(new UserDto(id,pw))) {     // 로그인 성공 시,
      // 2.1 세션에 sid 저장
      request.getSession(false).setAttribute("sid", id);
      // 2.2 쿠키 id, remember 생성
      Cookie cookieID = new Cookie("id", id);
      Cookie cookieRemember = new Cookie("remember", remember);
      // checked 경우, 쿠키 수명 15일
      if ("on".equals(remember)) {
        cookieID.setMaxAge      (60 * 60 * 24* 15);
        cookieRemember.setMaxAge(60 * 60 * 24* 15);
      } else {
        // 기본 쿠키 수명 10분
        cookieID.setMaxAge(60 * 10);
        cookieRemember.setMaxAge(0);
      }

      // response에 쿠키를 붙인다
      response.addCookie(cookieID);
      response.addCookie(cookieRemember);

      // 이전 접속시간 쿠키 생성+부여
      String prevAccTime = userDao.selectPrevDate(id); // DB에서 이전 접속시간 획득
      Cookie cookiePrevAccTime = new Cookie("prevAccTime",  prevAccTime);
      cookiePrevAccTime.setMaxAge(60 * 60 * 24 * 31);     // 이전 접속시간 쿠키 수명 31일
      response.addCookie(cookiePrevAccTime);

      // 첫 요청 URL 여부에 따른 redirect 분기
      if( url!=null && !url.isEmpty()) {       // URL 있다
        System.out.println(url);
        response.sendRedirect(url);
      }else {
        System.out.println(url);
        return "redirect:welcome";   // URL 없다(기본)
      }
    }
    return "login";
  }
}

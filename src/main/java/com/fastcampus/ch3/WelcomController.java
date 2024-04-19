package com.fastcampus.ch3;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

public class WelcomController {

  public String welcome() {
    System.out.println("this is welcome page");
    return "sWelcome";
  }
}

package com.fastcampus.repository;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class UserDaoImplTest {
  @Autowired
  UserDao userDao;

  @Test
  public void 유저Dao_session_확인() throws Exception {
    assertTrue(userDao != null);
    System.out.println("<TEST> [userDao] " + userDao);
    System.out.println("<TEST> [userDao] " + userDao.countUser());
  }

  @Test
  public void validateUser_test() throws Exception {
    assertTrue(userDao.validateUser(new UserDto("asdf", "1234")));
    assertFalse(userDao.validateUser(new UserDto("asdf", "12345")));
    // ㅇㅣ거 왜 빈칸이 TRUE ㅊㅟ급?
    assertTrue(userDao.validateUser(new UserDto("asdf", "1234 ")));
  }
}
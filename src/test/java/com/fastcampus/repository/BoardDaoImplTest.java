package com.fastcampus.repository;

import static org.junit.Assert.*;

import java.sql.SQLOutput;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations =
    {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class BoardDaoImplTest {
  @Autowired
  private BoardDao boardDao;

  @Test
  public void selectPostsTest() {  }
  @Test
  public void selectCountTest(){  }
  @Test
  public void readOneTest(){
    System.out.println("boardDao.readOne(5) = " + boardDao.readOne(506));
    // whatif, param : null ?
//    boardDao.readOne(Integer.parseInt(request.getParameter("bno")));

  }
  @Test
  public void writeOneTest(){
    boardDao.writeOne(new BoardDto("titleTest","usernameTest", "this is a test sample"));
  }


}
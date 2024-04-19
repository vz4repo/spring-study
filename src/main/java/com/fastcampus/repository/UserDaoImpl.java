package com.fastcampus.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao{
  @Autowired
  private SqlSession session;
  private static String namespace = "com.fastcampus.repository.UserDao.";

  //  CRUD
// C : create
  @Override
  public int insertUser(UserDto userDto) {
    return 0;
  }
// R : read
  @Override
  public Integer countUser() {
    return session.selectOne(namespace+"countUser");
  }
  @Override
  public String selectPrevDate(String username) {
    return session.selectOne(namespace+"selectPrevDate", username);
  }
  @Override
  public boolean validateUser(UserDto userDto) {
    return session.selectOne(namespace+"validateUser", userDto);
  }
// U : update
  @Override
  public int updateUser(UserDto userDto) {
    return 0;
  }
  @Override
  public void updatePrevDate(String username) {
    session.update(namespace+"updatePrevDate", username);
  }
// D : delete
  @Override
  public int deleteUser(String username) {
    return 0;
  }
}





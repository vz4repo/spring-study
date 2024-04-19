package com.fastcampus.repository;

import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {
  //  CRUD
  // C : create
  int insertUser(UserDto userDto);
  // R : read
  Integer countUser();
  String selectPrevDate(String username);
  boolean validateUser(UserDto userDto);
  // U : update
  int updateUser(UserDto userDto);
  void updatePrevDate(String username);
  // D : delete
  int deleteUser(String username);
}

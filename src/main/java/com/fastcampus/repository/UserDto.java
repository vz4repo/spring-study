package com.fastcampus.repository;

public class UserDto {
  String username;
  String password;
  String prevLogin;

  public UserDto() {
  }

   public UserDto(String username, String password) {
    this.username = username;
    this.password = password;
  }


  public String getPrevLogin() {
    return prevLogin;
  }

  public void setPrevLogin(String prevLogin) {
    this.prevLogin = prevLogin;
  }

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  @Override
  public String toString() {
    return "UserDto{" +
        "username='" + username + '\'' +
        ", password='" + password + '\'' +
        ", prevLogin='" + prevLogin + '\'' +
        '}';
  }
}

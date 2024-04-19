package com.fastcampus.repository;
/*
* TODO : DB 스키마에 쓰는 변수 표기법, JAVA convention에 대한 고민
*  camelcase로 그냥 다 써도 상관없는건가?
* */
public class BoardDto {
  int seq;
  String title;
  String username;
  String registerDate;
  int viewCount;

  String content;

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public BoardDto() {  }

  public BoardDto(int seq, String title, String content) {
    this.seq = seq;
    this.title = title;
    this.content = content;
  }

  public BoardDto(String title, String username, String content) {
    this.title = title;
    this.username = username;
    this.content = content;
  }

  public BoardDto(int seq, String title, String username, String registerDate, int viewCount, String content) {
    this.seq = seq;
    this.title = title;
    this.username = username;
    this.registerDate = registerDate;
    this.viewCount = viewCount;
    this.content = content;
  }

  public int getSeq() {
    return seq;
  }

  public void setSeq(int seq) {
    this.seq = seq;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getRegisterdate() {
    return registerDate;
  }

  public void setRegisterdate(String registerDate) {
    this.registerDate = registerDate;
  }

  public int getViewcount() {
    return viewCount;
  }

  public void setViewcount(int viewCount) {
    this.viewCount = viewCount;
  }

  @Override
  public String toString() {
    return "BoardDto{" +
          "seq=" + seq +
        ", title='" + title + '\'' +
        ", username='" + username + '\'' +
        ", registerDate='" + registerDate + '\'' +
        ", viewCount=" + viewCount + '\'' +
        ", content='" + content + '\'' +
        '}';
  }
}

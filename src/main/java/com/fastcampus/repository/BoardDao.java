package com.fastcampus.repository;

import java.util.List;
import org.springframework.stereotype.Repository;

@Repository
public interface BoardDao {
  List<BoardDto> selectPosts(int pageNum);
  Integer selectCount();
  BoardDto readOne (int bno);
  Integer increaseViewCount(int bno);
  void writeOne(BoardDto boardDto);
  Integer deletePost(int bno);

  Integer updatePost(BoardDto boardDto);
}

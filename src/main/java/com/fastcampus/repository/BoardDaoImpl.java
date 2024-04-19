package com.fastcampus.repository;


import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDaoImpl implements BoardDao{

  @Autowired
  private SqlSession session;
  private static String namespace = "com.fastcampus.repository.BoardDao.";


  @Override
  public List<BoardDto> selectPosts(int pageNum) {
    return session.selectList(namespace+"selectPosts", pageNum);
  }

  @Override
  public BoardDto readOne(int bno) {
    return session.selectOne(namespace+"readOne",bno);
  }

  @Override
  public Integer increaseViewCount(int bno) {
    return session.update(namespace+"increaseViewCount", bno);
  }

  @Override
  public void writeOne(BoardDto boardDto)
  {
    session.insert(namespace+"writeOne", boardDto);
  }

  @Override
  public Integer deletePost(int bno) {
    return session.delete(namespace+"deletePost", bno);
  }

  @Override
  public Integer updatePost(BoardDto boardDto) {
    return session.update(namespace+"updatePost", boardDto);
  }

  @Override
  public Integer selectCount() {
    return session.selectOne(namespace+"selectCount");
  }
}

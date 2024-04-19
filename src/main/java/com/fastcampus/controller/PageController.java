package com.fastcampus.controller;


import com.fastcampus.repository.BoardDao;
import com.fastcampus.repository.BoardDto;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PageController {
  @Autowired
  BoardDao boardDao;

  @GetMapping("admin")
  public String admin(Model model) {
    System.out.println("[ admin ]");    // 공통으로 뽑을 예정
    model.addAttribute("pageName", "/WEB-INF/views/admin.jsp");
    return "layout";
  }

  @GetMapping("board")
  public String board(HttpServletRequest request , Model model) {
    System.out.println("[ board ]");    // 공통으로 뽑을 예정
    int currentPage =  1;  // 기본값 1 초기화
    int totalPage   =  0;  // 기본값 0 초기화
    int requestPage =  1;  // 기본값 1 초기화
    int queryOffset =  0;  // 기본값 0 초기화

    // 요청에서 Param 획득
    // TODO: ㅇㅕ기서 형변환 안해주고 ㅂㅏ로 mybatis로 넘기면 어떻게 되나 ???
    if (request.getParameter("page") != null) {
      requestPage = Integer.parseInt(request.getParameter("page"));
    }

    // 요청 페이지 계산
    // DB offset 설정 (('요청페이지'-1) * 10)
    queryOffset = (requestPage-1)*10;
    // 요청 param이 현제 페이지
    currentPage = requestPage;
    totalPage = requestPage%10==0 ? requestPage/10-1 : requestPage/10;

    model.addAttribute("posts", boardDao.selectPosts(queryOffset));
    model.addAttribute("currentPage", currentPage);
    model.addAttribute("totalPage", totalPage);
    model.addAttribute("postsCount", boardDao.selectCount());
    model.addAttribute("pageName", "/WEB-INF/views/board.jsp");
    return "layout";
  }

  /* param validation
  * - 받는 값의 형태가 서로 안맞는 경우. 특히 숫자-문자
  * - 받는 값의 범위를 넘는 경우, 특히 숫자
  * - 받는 값의 형태가 다른 경우, 특히 실수/정수, 특수문자
  *
  * */
  @GetMapping("read")
  public String read(HttpServletRequest request,Model model) {
    System.out.print("[ read ");
    int bno = Integer.parseInt(request.getParameter("bno"));
    System.out.println(bno +" ]");

    // 읽기와 동시에 조회수 증가
    boardDao.increaseViewCount(bno);
    // 읽기 수행
    model.addAttribute("post",boardDao.readOne(bno));
    model.addAttribute("pageName", "/WEB-INF/views/post.jsp");
    return "layout";
  }

  @PostMapping("remove")
  @ResponseBody
  public ResponseEntity<?> remove(@RequestBody Map<String, Object> payload) {
    System.out.print("[ remove ");
    // TODO: 고칠수있나.....
    // 삭제 로직 수행
    int bno = Integer.valueOf((String) payload.get("bno"));
    System.out.println(bno + " ]");

    // 응답 반환
    Map<String, Object> response = new HashMap<>();
    response.put("status", "success");
    response.put("redirect", "/board");

    // 확인
    System.out.println("boardDao.deletePost(bno) = " + boardDao.deletePost(bno));
    System.out.println("response.entrySet() = " + response.entrySet());

    return ResponseEntity.ok(response);
  }

  /* 글쓰기<버튼> -> 새글.jsp*/
  @GetMapping("write")
  public String write(Model model) {
    System.out.println("[ new post jsp ]");

    model.addAttribute("pageName", "/WEB-INF/views/newPost.jsp");
    return "layout";
  }

  /* 새글.jsp 에서 작성 후, 글쓰기 수행 */
  @PostMapping("write")
  public String write(HttpServletRequest request, Model model) {
    System.out.println("[ new post write ]");

    String title = request.getParameter("title");
    String username = String.valueOf(request.getSession().getAttribute("sid"));
    if(username.equals("null") || username.trim().isEmpty()){   // null 혹은 공백
      username = "ㅇㅇ";
    }
    String content = request.getParameter("content");
// 값에 대한 validation 필요
    BoardDto postDetail = new BoardDto(title, username, content);
    System.out.println("postDetail.toString() = " + postDetail.toString());
    boardDao.writeOne(postDetail);
//    model.addAttribute("pageName", "/WEB-INF/views/newPost.jsp");
    return "redirect:board";
  }

  /* 수정<버튼> -> 수정.jsp
  * javascript로 수정 모드로만 전환하는건?
  * */
  @GetMapping("modify")
  public String modify(HttpServletRequest request, Model model) {
    System.out.print("[ Modify ");
    int bno = Integer.parseInt(request.getParameter("bno"));
    System.out.println(bno +" ]");

    model.addAttribute("post", boardDao.readOne(bno));
    model.addAttribute("pageName", "/WEB-INF/views/newPost.jsp");
    return "layout";
  }

  @PostMapping("modify")
  public String modify(HttpServletRequest request) {
    System.out.println("[ Modify post ]");

    BoardDto boardDto = new BoardDto(Integer.parseInt(request.getParameter("bno")), request.getParameter("title"),request.getParameter("content"));
    System.out.println("boardDto.toString() = " + boardDto.toString());
    System.out.println("boardDao.updatePost(boardDto) -> "+ boardDao.updatePost(boardDto));
    return "redirect:board";
  }



  @GetMapping("info")
  public String info(Model model) {

    System.out.println("[ info ]");     // 공통으로 뽑을 예정
    model.addAttribute("pageName", "/WEB-INF/views/info.jsp");
    return "layout";
  }

  @GetMapping("setting")
  public String setting(Model model) {
    System.out.println("[ setting ]");    // 공통으로 뽑을 예정
    model.addAttribute("pageName", "/WEB-INF/views/setting.jsp");
    return "layout";
  }

  @GetMapping("users")
  public String users(Model model) {
    System.out.println("[ users ]");    // 공통으로 뽑을 예정
    model.addAttribute("pageName", "/WEB-INF/views/users.jsp");
    return "layout";
  }

  @GetMapping("welcome")
  public String welcome(Model model) {
    System.out.println("[ welcome ]");    // 공통으로 뽑을 예정
    model.addAttribute("pageName", "/WEB-INF/views/welcome.jsp");
    return "layout";
  }

}

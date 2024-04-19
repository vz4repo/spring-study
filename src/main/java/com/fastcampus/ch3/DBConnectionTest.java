package com.fastcampus.ch3;

import java.sql.*;

public class DBConnectionTest {
    public static void main(String[] args) throws Exception {
        final String DB_URL = "jdbc:mariadb://localhost:3306/dev?useUnicode=true&characterEncoding=utf8";
        final String DB_USER = "root";
        final String DB_PASSWORD = "root";

        Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD); // 데이터베이스의 연결을 얻는다.
        Statement stmt  = conn.createStatement(); // Statement를 생성한다.

        String query = "SELECT now()"; // 시스템의 현재 날짜시간을 출력하는 쿼리(query)
        ResultSet rs = stmt.executeQuery(query); // query를 실행한 결과를 rs에 담는다.

        // 실행결과가 담긴 rs에서 한 줄씩 읽어서 출력
        while (rs.next()) {
            String curDate = rs.getString(1);  // 읽어온 행의 첫번째 컬럼의 값을 String으로 읽어서 curDate에 저장
            System.out.println("[SELECT now() ->"+curDate);       // 2022-01-11 13:53:00.0
        }
    } // main()
}

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String PATH = request.getContextPath(); %>
<%  // 그냥 확인용
    String pageName = (String)request.getAttribute("pageName");   // request 속성인 pageCoName에서 파일명을 가져옴
    System.out.println("[layout]PATH: " + PATH);                  // 확인
    System.out.println("[layout]pageName: " + pageName);          // 확인
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${pageTitle}</title>
    <%--  favicon  --%>
    <link rel="icon" href="<c:url value='/resources/favicon.ico'/>" type="image/x-icon"/>
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
    <%--  global css --%>
    <link href="/css/content.css" rel="stylesheet" />
</head>
<body class="bg-gray-900 text-white">
<header>
    <%@ include file="header.jsp" %>
</header>
<main>
        <jsp:include page="<%= pageName %>" />
<%--        <%@ include file="${pageName}.jsp"%>--%>
</main>
<footer class="bg-gray-800 absolute p-4 bottom-0 w-full">
    <%@ include file="footer.jsp" %>
</footer>
</body>
</html>
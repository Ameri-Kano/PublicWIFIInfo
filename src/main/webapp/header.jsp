<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HashMap<String, String> siteTitle = new HashMap<>();
    siteTitle.put("/index.jsp", "서울 공공 WIFI 정보");
    siteTitle.put("/history.jsp", "위치 히스토리 목록");
    siteTitle.put("/detail.jsp", "상세 정보");
    siteTitle.put("/bookmark-list.jsp", "북마크 목록");
    siteTitle.put("/bookmark-group.jsp", "북마크 그룹 관리");
    siteTitle.put("/add-bookmark-group.jsp", "북마크 그룹 추가");
    siteTitle.put("/edit-bookmark-group.jsp", "북마크 그룹 수정");
    siteTitle.put("/delete-bookmark-group.jsp", "북마크 그룹 삭제");
    siteTitle.put("/delete-bookmark.jsp", "북마크 삭제");
%>
<html>
<head>
    <title><%=siteTitle.get(request.getServletPath())%></title>
</head>
<body>
    <h1><%=siteTitle.get(request.getServletPath())%></h1>
    <br/>
    <div>
        <a href="index.jsp">홈</a><a> | </a>
        <a href="history.jsp">위치 히스토리</a><a> | </a>
        <a href="load-wifi">공공 WIFI 정보 가져오기</a><a> | </a>
        <a href="bookmark-list.jsp">북마크 보기</a><a> | </a>
        <a href="bookmark-group.jsp">북마크 그룹 관리</a>
    </div>
    <br/>
</body>
</html>

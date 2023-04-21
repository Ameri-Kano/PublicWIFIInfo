<%@ page import="com.amerikano.publicwifiinfo.GlobalConstant" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    GlobalConstant.initHashMap();
%>

<html>
<head>
    <title>header</title>
</head>
<body>
    <h1><%=GlobalConstant.siteTitle.get(request.getServletPath())%></h1>
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

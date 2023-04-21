<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.amerikano.publicwifiinfo.DBManager" %>

<!DOCTYPE html>
<html>
    <head>
        <title>서울 공공 WIFI 정보</title>
        <link rel="stylesheet" href="stylesheet.css">
    </head>
    <body>
    <!-- 헤더 -->
        <jsp:include page="header.jsp"/>
    <!-- 메인 화면 -->
        <br/>
        <div>
            <jsp:include page="infoTable.jsp"/>
        </div>
    </body>
</html>
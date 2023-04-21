<%@ page import="java.sql.*" %>
<%@ page import="com.amerikano.publicwifiinfo.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id");
    application.setAttribute("id", id);
    ResultSet rs = DBManager.getResultSet("SELECT * FROM bookmark_group WHERE ID="+id);
    String targetName = "";
    Integer targetRank = null;

    if (rs != null) {
        try {
            targetName = rs.getString("name");
            targetRank = rs.getInt("rank");
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

<html>
<head>
    <title><%=GlobalConstant.appTitle%></title>
    <link rel="stylesheet" href="stylesheet.css">
</head>
<body>
    <jsp:include page="header.jsp"/>
    <a>이 북마크 그룹을 삭제하겠습니까?</a>
    <br/>
    <table>
        <form action="./delete-bookmark-group-submit.jsp" method="post">
            <tr>
                <th>북마크 이름</th>
                <td><%=targetName%></td>
            </tr>
            <tr>
                <th>순서</th>
                <td><%=targetRank%></td>
            </tr>
            <tr>
                <td style="text-align: center;" colspan="2">
                    <a href="javascript:history.back()">돌아가기</a>
                    <a> | </a>
                    <button>삭제</button>
                </td>
            </tr>
        </form>
    </table>
</body>
</html>
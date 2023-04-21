<%@ page import="java.sql.*" %>
<%@ page import="com.amerikano.publicwifiinfo.DBManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String[] columns = {"ID","북마크 이름","순서","등록일자","수정일자","비고"}; %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="stylesheet.css">
</head>
<body>
    <jsp:include page="header.jsp"/>
    <button onclick="location.href='add-bookmark-group.jsp'">북마크 그룹 추가</button>
    <table>
        <thead>
            <tr>
                <% for (String column : columns) { %>
                <th><%=column%></th>
                <% } %>
            </tr>
        </thead>
        <%  Connection connection = null;
            Statement statement;
            ResultSet rs;
            try {
                Class.forName("org.sqlite.JDBC");
                connection = DriverManager.getConnection("jdbc:sqlite:/" + DBManager.db);
            } catch (Exception e) { %>
        <tr class="empty">
            <td colspan="6">DB 연결 실패</td>
        </tr>
        <%  }
            try {
                statement = connection.createStatement();
                String sql = "SELECT * FROM bookmark_group ORDER BY rank";
                rs = statement.executeQuery(sql);

                while(rs.next()) { %>
        <tr>
            <%  for (int i = 1; i <= 6; i++) {
                if(i == 6) { %>
            <td style="text-align: center">
                <a href="./edit-bookmark-group.jsp?id=<%=rs.getString(1)%>">수정</a>
                <a href="./delete-bookmark-group.jsp?id=<%=rs.getString(1)%>">삭제</a>
            </td>
            <%  } else  {%>
            <td><%=rs.getString(i)%></td>
            <%  }
            } %>
        </tr>
        <%  }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace(); %>
        <tr class="empty">
            <td colspan="6">SQL 처리 과정 오류</td>
        </tr>
        <%  } %>
    </table>
</body>
</html>

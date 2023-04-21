<%@ page import="java.sql.*" %>
<%@ page import="com.amerikano.publicwifiinfo.DBManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String[] columns = {"ID","북마크 이름","와이파이명","등록일자","비고"}; %>
<html>
<head>
    <title></title>

    <link rel="stylesheet" href="stylesheet.css">
</head>
<body>
    <jsp:include page="header.jsp"/>
    <table>
        <thead>
        <tr>
            <% for (String column : columns) { %>
            <th><%=column%></th>
            <% } %>
        </tr>
        <%  Connection connection = null;
            Statement statement;
            ResultSet rs;
            try {
                Class.forName("org.sqlite.JDBC");
                connection = DriverManager.getConnection("jdbc:sqlite:/" + DBManager.db);
            } catch (Exception e) { %>
        <tr class="empty">
            <td colspan="5">DB 연결 실패</td>
        </tr>
        <%  }
            try {
                statement = connection.createStatement();
                String sql = "SELECT b.*, p.name FROM bookmark_list b JOIN PublicWifiInfo p ON b.mgrNo = p.mgrNo";
                rs = statement.executeQuery(sql);

                while(rs.next()) { %>
        <tr>
            <%  for (int i = 1; i <= 5; i++) {
                if(i == 5) { %>
            <td style="text-align: center">
                <a href="delete-bookmark.jsp?id=<%=rs.getString(1)%>">삭제</a>
            </td>
            <%  } else if(i == 3) {%>
            <td><a href="detail.jsp?mgrNo=<%=rs.getString(3)%>"><%=rs.getString(5)%></a></td>
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
            <td colspan="5">SQL 처리 과정 오류</td>
        </tr>
        <%  } %>
        </thead>
    </table>
</body>
</html>

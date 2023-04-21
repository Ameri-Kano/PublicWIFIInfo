<%@ page import="java.sql.*" %>
<%@ page import="com.amerikano.publicwifiinfo.DBManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>서울 공공 WIFI 정보</title>
    <link rel="stylesheet" href="stylesheet.css"/>
</head>
<body>
    <jsp:include page="header.jsp"/>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>위도</th>
                <th>경도</th>
                <th>조회일시</th>
                <th>비고</th>
            </tr>
        </thead>
<%      Connection connection = null;
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
            String sql = "SELECT * FROM LocationHistory";
            rs = statement.executeQuery(sql);

            while (rs.next()) { %>
            <tr>
            <%  for (int i = 1; i <= 5; i++) {
                    if(i == 5) { %>
                <td style="text-align: center">
                    <form id="deleteForm" action="./delete-history-submit.jsp" method="post" onsubmit="return confirmSubmit();">
                        <button id ="deleteButton" name="deleteID" value=<%=rs.getString(1)%>>삭제</button>
                    </form>
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
            <td colspan="5">SQL 처리 과정 오류</td>
        </tr>
        <%  } %>
    </table>
    <br/>
    <script type="text/javascript">
        function confirmSubmit() {
            return confirm(`이 위치 히스토리를 삭제하겠습니까?`);
        }
    </script>
</body>
</html>

<%@ page import="java.sql.*" %>
<%@ page import="com.amerikano.publicwifiinfo.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><%=GlobalConstant.appTitle%>></title>
</head>
<body onload="addBookMark()">
    <script type="text/javascript">
        function addBookMark() {
            <%
            Connection connection = null;
            Statement statement;
            String name = request.getParameter("name");
            String rank = request.getParameter("rank");
            if (name != null) {
                try {

                    Class.forName("org.sqlite.JDBC");
                    connection = DriverManager.getConnection("jdbc:sqlite:/" + DBManager.db);
                } catch (Exception e) {
                    out.println("alert(\"DB 연결 실패\");");
                }
                try {
                    statement = connection.createStatement();
                    String sql = "INSERT INTO bookmark_group (name, rank, added_date) " +
                     "VALUES ('"+name+"', "+rank+", datetime('now','localtime'))";
                    statement.execute(sql);
                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                out.println("alert(\"북마크 그룹 추가가 완료되었습니다.\");");
                out.println("location.href=\"./bookmark-group.jsp\";");
            }
            %>
        }
    </script>
</body>
</html>

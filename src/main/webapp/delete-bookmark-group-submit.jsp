<%@ page import="java.sql.*" %>
<%@ page import="com.amerikano.publicwifiinfo.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><%=GlobalConstant.appTitle%></title>
</head>
<body onload="deleteBookMarkGroup()">
<script type="text/javascript">
    function deleteBookMarkGroup() {
        <%
            Connection connection = null;
            Statement statement;
            String id = application.getAttribute("id").toString();
            application.removeAttribute("id");

            try {
                Class.forName("org.sqlite.JDBC");
                connection = DriverManager.getConnection("jdbc:sqlite:/" + DBManager.db);
            } catch (Exception e) {
                out.println("alert(\"DB 연결 실패\");");
                out.println("location.href=\"./bookmark-group.jsp\";");
            }

            try {
                statement = connection.createStatement();
                String sql = "DELETE FROM bookmark_group WHERE id="+id;
                statement.execute(sql);
                connection.close();
                out.println("alert(\"북마크 그룹 삭제가 완료되었습니다.\");");
                out.println("location.href=\"./bookmark-group.jsp\";");
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("alert(\"삭제 중 오류 발생\");");
                out.println("location.href=\"./bookmark-group.jsp\";");
            }
        %>
    }
</script>
</body>
</html>

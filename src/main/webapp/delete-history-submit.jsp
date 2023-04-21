<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="com.amerikano.publicwifiinfo.DBManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>서울 공공 WIFI 정보</title>
</head>
<body onload="deleteHistory()">
    <script type="text/javascript">
        function deleteHistory() {
            <%
            Connection connection = null;
            Statement statement;
            String id = request.getParameter("deleteID");
            if (id != null) {
                try {
                    Class.forName("org.sqlite.JDBC");
                    connection = DriverManager.getConnection("jdbc:sqlite:/" + DBManager.db);
                } catch (Exception e) {
                    out.println("alert(\"DB 연결 오류\");");
                    out.println("location.href=\"./history.jsp\";");
                    }
                try {
                    statement = connection.createStatement();
                    String sql = "DELETE FROM LocationHistory WHERE ID="+id;
                    statement.execute(sql);
                    connection.close();
                    out.println("alert(\"위치 히스토리가 삭제되었습니다.\");");
                    out.println("location.href=\"./history.jsp\";");
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } %>
        }
    </script>
</body>
</html>

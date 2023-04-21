<%@ page import="java.sql.*" %>
<%@ page import="com.amerikano.publicwifiinfo.DBManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>서울 공공 WIFI 정보</title>
</head>
<body onload="deleteBookmark()">
  <script type="text/javascript">
    function deleteBookmark() {
      <%
        Connection connection = null;
        Statement statement;
        String id = request.getParameter("id");

        if (id != null) {
            try {
                Class.forName("org.sqlite.JDBC");
                connection = DriverManager.getConnection("jdbc:sqlite:/" + DBManager.db);
            } catch (Exception e) {
                out.println("alert(\"DB 연결 오류\");");
                out.println("location.href=\"./bookmark-list.jsp\";");
            }
            try {
                statement = connection.createStatement();
                String sql = "DELETE FROM bookmark_list WHERE ID="+id;
                statement.execute(sql);
                connection.close();
                out.println("alert(\"북마크가 삭제되었습니다.\");");
                out.println("location.href=\"./bookmark-list.jsp\";");
            } catch (Exception e) {
                out.println("alert(\"삭제 중 오류 발생\");");
                out.println("location.href=\"./bookmark-list.jsp\";");
                e.printStackTrace();
            }
        }
      %>
    }
  </script>
</body>
</html>

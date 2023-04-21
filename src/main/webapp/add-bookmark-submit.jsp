<%@ page import="java.sql.*" %>
<%@ page import="com.amerikano.publicwifiinfo.DBManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>서울 공공 WIFI 정보</title>
</head>
<body onload="addBookMark()">
<script type="text/javascript">
  function addBookMark() {
      <%
      Connection connection = null;
      Statement statement;
      String selectedGroup = request.getParameter("selectedGroup");
      String selectedMgrNo= application.getAttribute("selectedMgrNo").toString();
      application.removeAttribute("selectedMgrNo");

      try {
          Class.forName("org.sqlite.JDBC");
          connection = DriverManager.getConnection("jdbc:sqlite:/" + DBManager.db);
      } catch (Exception e) {
          out.println("alert(\"DB 연결 실패\");");
          out.println("location.href=\"./bookmark-list.jsp\";");
      }
      try {
          statement = connection.createStatement();
          String sql = "INSERT INTO bookmark_list (name, mgrNo, add_date) " +
           "VALUES ('"+selectedGroup+"', '"+selectedMgrNo+"', datetime('now','localtime'))";
          statement.execute(sql);
          connection.close();
          out.println("alert(\"북마크 추가 완료되었습니다.\");");
          out.println("location.href=\"./bookmark-list.jsp\";");
      } catch (SQLException e) {
          e.printStackTrace();
          out.println("alert(\"추가 중 오류 발생\");");
          out.println("location.href=\"./bookmark-list.jsp\";");
      } %>
  }
</script>
</body>
</html>

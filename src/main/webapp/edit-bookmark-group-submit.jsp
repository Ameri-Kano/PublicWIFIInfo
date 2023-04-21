<%@ page import="java.sql.*" %>
<%@ page import="com.amerikano.publicwifiinfo.DBManager" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>서울 공공 WIFI 정보</title>
</head>
<body onload="editBookMarkGroup()">
<script type="text/javascript">
function editBookMarkGroup() {
    <%
        Connection connection = null;
        PreparedStatement prepStatement;
        String id = application.getAttribute("id").toString();
        String newName = request.getParameter("name");
        String newRank = request.getParameter("rank");
        application.removeAttribute("id");
        try {
            Class.forName("org.sqlite.JDBC");
            connection = DriverManager.getConnection("jdbc:sqlite:/" + DBManager.db);
        } catch (Exception e) {
            out.println("alert(\"DB 연결 실패\");");
            out.println("location.href=\"./bookmark-group.jsp\";");
        }
        try {
            String sql = "UPDATE bookmark_group SET " +
                    "name='"+newName+"', rank="+newRank+", changed_date=datetime('now','localtime') WHERE id="+id;
            prepStatement = connection.prepareStatement(sql);
            prepStatement.executeUpdate();
            connection.close();
            out.println("alert(\"북마크 그룹 이름 변경이 완료되었습니다.\");");
            out.println("location.href=\"./bookmark-group.jsp\";");
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("alert(\"수정 중 오류 발생\");");
            out.println("location.href=\"./bookmark-group.jsp\";");
        } %>
    }
</script>
</body>
</html>

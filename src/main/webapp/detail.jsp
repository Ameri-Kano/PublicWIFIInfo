<%@ page import="com.amerikano.publicwifiinfo.DBManager" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String mgrNo = request.getParameter("mgrNo");
    String[] columns = {"관리번호", "자치구", "와이파이명", "도로명주소",
            "상세주소", "설치위치(층)", "설치유형", "설치기관",
            "서비스구분", "망종류", "설치년도", "실내외구분",
            "접속환경", "위도", "경도", "작업일자"};

    ResultSet rs = DBManager.getResultSet("SELECT id, name FROM bookmark_group");
    HashMap<Integer, String> bookmarkGroup = new HashMap<>();

    if (rs != null) {
        try {
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                bookmarkGroup.put(id, name);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    application.setAttribute("selectedMgrNo", mgrNo);
%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="stylesheet.css">
</head>
    <body>
        <jsp:include page="header.jsp"/>
        <form action="./add-bookmark-submit.jsp" method="post">
            <select name="selectedGroup" onchange="handleChange()">
                <option value=' '>북마크 그룹 선택</option>
                <% for (int i: bookmarkGroup.keySet()) { %>
                    <option value='<%=bookmarkGroup.get(i)%>'><%=bookmarkGroup.get(i)%></option>
                <% } %>
            </select>
            <button>북마크 추가하기</button>
        </form>
        <br/>
        <table>
            <% Connection connection = null;
                Statement statement = null;

                try {
                    Class.forName("org.sqlite.JDBC");
                    connection = DriverManager.getConnection("jdbc:sqlite:/" + DBManager.db);
                } catch (Exception e) { %>
                    <tr class="empty">
                        <td>DB 연결 실패</td>
                    </tr>
            <%  }
                try {
                    statement = connection.createStatement();
                    String sql = "SELECT * FROM PublicWifiInfo WHERE mgrNo='"+mgrNo+"'";
                    rs = statement.executeQuery(sql);
                    while (rs.next()) {
                        for (int i = 1; i <= columns.length; i++) { %>
                            <tr>
                                <th><%=columns[i-1]%></th>
                                <td><%=rs.getString(i)%></td>
                            </tr>
            <%          }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
            }
            %>
        </table>
        <br/>
        <div style="text-align:center;">
            <a href="javascript:history.back()">뒤로가기</a>
        </div>
    </body>
</html>

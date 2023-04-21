<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.amerikano.publicwifiinfo.*" %>
<%@ page import="java.sql.*" %>
<%
    String latitude = request.getParameter("lat");
    String longitude = request.getParameter("lng");
    String[] columns = {"거리(km)", "관리번호", "자치구", "와이파이명", "도로명주소",
            "상세주소", "설치위치(층)", "설치유형", "설치기관",
            "서비스구분", "망종류", "설치년도", "실내외구분",
            "접속환경", "위도", "경도", "작업일자"};
%>
<html>
<head>
    <title><%=GlobalConstant.appTitle%>></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheet.css">
</head>
<body>
    <div>
        <form action="index.jsp" onsubmit="return checkForm()">
            위도: <input type="text" id="currentLatitude" name="lat" value="<%=latitude == null ? 0.0 : latitude%>">
            경도: <input type="text" id="currentLongitude" name="lng" value="<%=longitude == null ? 0.0 : longitude%>">
            <button type="button" onclick=getCurrentLocation()>내 위치 가져오기</button>
            <button id="showResult">근처 WIFI 정보 보기</button>
        </form>
    </div>
    <br/>
    <table>
        <thead>
            <tr>
                <% for (String column : columns) { %>
                <th><%=column%></th>
                <% } %>
            </tr>
        </thead>
        <%if (latitude == null || longitude == null) { %>
        <tr class="empty">
            <td style="text-align: center;" colspan="17">위치 정보를 가져온 후에 조회해 주세요.</td>
        </tr>
        <% } else {
            Connection connection = null;
            Statement statement;
            ResultSet rs;
            try {
                Class.forName("org.sqlite.JDBC");
                connection = DriverManager.getConnection("jdbc:sqlite:/" + DBManager.db);
            } catch (Exception e) { %>
                <tr class="empty">
                    <td colspan="17">DB 연결 실패</td>
                </tr>
        <%  }
            try {
                statement = connection.createStatement();
                String sql = "SELECT round((6371 * acos(cos(radians("+latitude+"))*cos(radians(p.latitude))*cos(radians(p.longitude)-radians("+longitude+"))+sin(radians("+latitude+"))*sin(radians(p.latitude)))), 3)\n"+
                        "AS dist, *\n" +
                        "FROM PublicWifiInfo p\n" +
                        "ORDER BY dist\n"+
                        "LIMIT 20";
                rs = statement.executeQuery(sql);

                while(rs.next()) {
                    int columnCount = rs.getMetaData().getColumnCount(); %>
                    <tr>
        <%          for (int i = 1; i <= columnCount; i++) {
                            String currentColumn = ("null").equals(rs.getString(i)) ? "" : rs.getString(i);
                        if(i == 4) { %>
                                <td><a href="./detail.jsp?mgrNo=<%=rs.getString(2)%>"><%=currentColumn%></a></td>
                        <% } else { %>
                            <td><%=currentColumn%></td>
        <%              }
                    } %>
                    </tr>
        <%      }
                statement.execute("INSERT INTO LocationHistory (latitude, longitude, added_date) " +
                        "VALUES ("+latitude+", "+longitude+", datetime('now','localtime'))");
                connection.close();
            } catch (Exception e) {
                e.printStackTrace(); %>
                <tr class="empty">
                    <td colspan="17">SQL 처리 과정 오류</td>
                </tr>
        <%  }
        } %>
    </table>
        <script type="text/javascript" src="getCurrentLocation.js"></script>
        <script type="text/javascript">
            function checkForm() {
                const lat = document.getElementById("currentLatitude").value;
                const lng = document.getElementById("currentLongitude").value;
                if (lat == 0.0 && lng == 0.0) {
                    alert("위치를 먼저 가져온 후 실행해 주세요!");
                    return false;
                } else {
                    return true;
                }
            }
        </script>
    </body>
</html>

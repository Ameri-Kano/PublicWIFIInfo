<%@ page import="java.sql.*" %>
<%@ page import="com.amerikano.publicwifiinfo.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id");
    application.setAttribute("id", id);
    ResultSet rs = DBManager.getResultSet("SELECT * FROM bookmark_group WHERE ID="+id);
    String currentName = "";
    Integer currentRank = null;

    if (rs != null) {
        try {
            currentName = rs.getString("name");
            currentRank = rs.getInt("rank");
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

<html>
<head>
    <title><%=GlobalConstant.appTitle%></title>
    <link rel="stylesheet" href="stylesheet.css">
</head>
<body>
    <jsp:include page="header.jsp"/>
    <table>
        <form action="./edit-bookmark-group-submit.jsp" method="post" onsubmit="return checkForm();">
            <tr>
                <th>북마크 이름</th>
                <td><input type="text" id="nameInput" name="name" value="<%=currentName%>"/></td>
            </tr>
            <tr>
                <th>순서</th>
                <td><input type="text" id="rankInput" name="rank" value="<%=currentRank%>"/></td>
            </tr>
            <tr>
                <td style="text-align: center;" colspan="2">
                    <a href="javascript:history.back()">돌아가기</a>
                    <a> | </a>
                    <button name="<%=id%>" value="<%=id%>">수정</button>
                </td>
            </tr>
        </form>
    </table>
    <script type="text/javascript">
        function checkForm() {
            const name = document.getElementById("nameInput").value;
            const rank = document.getElementById("rankInput").value;
            if (name === '<%=currentName%>' && rank === '<%=currentRank%>') {
                alert("변경 내용이 없습니다!");
                return false;
            } else {
                return true;
            }
        }
    </script>
</body>
</html>
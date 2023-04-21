<%@ page import="com.amerikano.publicwifiinfo.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title><%=GlobalConstant.appTitle%>></title>
        <link rel="stylesheet" href="stylesheet.css">
    </head>
<body>
    <jsp:include page="header.jsp"/>
    <table>
        <form name="form" method="post" action="add-bookmark-group-submit.jsp"
              onsubmit="return checkForm()">
            <tr>
                <th>북마크 이름</th>
                <td><input type="text" name="name"/></td>
            </tr>
            <tr>
                <th>순서</th>
                <td><input type="text" name="rank"/></td>
            </tr>
            <tr>
            <td style="text-align: center;" colspan="2">
                <a href="javascript:history.back()">돌아가기</a>
                <a> | </a>
                <button>추가</button>
            </td>
            </tr>
        </form>
    </table>
    <script type="text/javascript">
        function checkForm() {
            const name = document.form.name.value;
            const rank = document.form.rank.value;
            if (name == "" || rank == "") {
                alert("올바른 정보를 입력해 주세요!");
                return false;
            } else {
                return true;
            }
        }
    </script>
</body>
</html>

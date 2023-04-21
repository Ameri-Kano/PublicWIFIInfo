<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.amerikano.publicwifiinfo.DBManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String id = request.getParameter("id");
  ResultSet rs = DBManager.getResultSet("SELECT b.name, p.name, b.add_date\n" +
          "            FROM bookmark_list b\n" +
          "            JOIN PublicWifiInfo p ON b.mgrNo = p.mgrNo");
  String bookmarkGroup = "";
  String wifiName = "";
  String addDate = "";

  if (rs != null) {
    try {
      bookmarkGroup = rs.getString(1);
      wifiName = rs.getString(2);
      addDate = rs.getString(3);
      rs.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
%>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="stylesheet.css">
</head>
  <body>
    <jsp:include page="header.jsp"/>
    <br/>
    <a>이 북마크를 삭제하시겠습니까?</a>
    <br/>
    <table>
      <form action="delete-bookmark-submit.jsp" method="post">
        <tr>
          <th>북마크 이름</th>
          <td><%=bookmarkGroup%></td>
        </tr>
        <tr>
          <th>와이파이명</th>
          <td><%=wifiName%></td>
        </tr>
        <tr>
          <th>등록일자</th>
          <td><%=addDate%></td>
        </tr>
        <tr>
          <td style="text-align: center" colspan="2">
            <a href="javascript:history.back();">돌아가기</a>
            <a> | </a>
            <button name="id" value="<%=id%>">삭제</button>
          </td>
        </tr>
      </form>
    </table>
  </body>
</html>

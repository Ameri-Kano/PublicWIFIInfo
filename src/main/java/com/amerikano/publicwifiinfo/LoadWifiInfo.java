package com.amerikano.publicwifiinfo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

@WebServlet(name = "loadWifi", value = "/load-wifi")
public class LoadWifiInfo extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        Connection connection;

        out.println("<html><body>");

        try {
            Class.forName("org.sqlite.JDBC");
            connection = DriverManager.getConnection("jdbc:sqlite:/" + DBManager.db);
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2>DB 연결 실패</h2>");
            out.println("<a href=\"index.jsp\">돌아가기</a>");
            out.println("</body></html>");
            return;
        }

        PublicWifiInfo publicWifiInfo = DBManager.addAllofData();
        out.println("<h2>"+publicWifiInfo.infoTable.totalCount+"개의 데이터를 추가합니다...</h2>");
        if (DBManager.insertToDB(publicWifiInfo, connection)) {
            out.println("<h2>데이터 저장 성공</h2>");
        } else {
            out.println("<h2>데이터 저장 실패</h2>");
        }

        out.println("<a href=\"index.jsp\">돌아가기</a>");
        out.println("</body></html>");
    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
package com.amerikano.publicwifiinfo;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        super.doGet(request, response);
        response.setContentType("text/html");

//        PrintWriter out = response.getWriter();
//        PublicWifiInfo publicWifiInfo = GetWIFIDataTest.convertJsonString(GetWIFIDataTest.responseJson);
//
//        if (GetWIFIDataTest.getWiFIJsonData()) {
//            out.println("<html><body>");
//            out.println("<h2>" + publicWifiInfo.infoTable.totalCount +"건 있습니다."+ "</h2>");
//            out.println("</body></html>");
//        }
    }

    public void destroy() {
    }
}
package com.amerikano.publicwifiinfo;

import java.sql.*;
import java.util.StringTokenizer;

public class DBManager {
    public static String db = "/Users/amerikano/IdeaProjects/PublicWIFIInfo/src/main/resources/db.sqlite3";
    public static boolean isDBEmpty = true;

    public static PublicWifiInfo addAllofData() {
        PublicWifiInfo newInfo = GetWIFIData.convertJsonString(GetWIFIData.getWiFIJsonData(1, 1000));
        int totalCount = newInfo.infoTable.totalCount;
        int currentStart = 1;
        int currentEnd = 1000;

        while (currentEnd < totalCount) {
            currentStart += 1000;
            if(currentEnd + 1000 >= totalCount) currentEnd = totalCount;
            else currentEnd += 1000;

            PublicWifiInfo tempInfo = GetWIFIData.convertJsonString
                    (GetWIFIData.getWiFIJsonData(currentStart, currentEnd));
            newInfo.infoTable.row.addAll(tempInfo.infoTable.row);
        }

        System.out.println("데이터 추가 완료");
        return newInfo;
    }

    public static boolean insertToDB(PublicWifiInfo newWifiInfo, Connection connection) {
        //PublicWifiInfo newWifiInfo = addAllofData();

        try {
            //connection = DriverManager.getConnection("jdbc:sqlite:/" + db);
            Statement statement = connection.createStatement();

            for (Row r : newWifiInfo.infoTable.row) {
                String sql = "INSERT INTO PublicWifiInfo VALUES" + r.toString() + ";";
                statement.execute(sql);
            }

            System.out.println("DB에 추가 완료");
            isDBEmpty = false;
            connection.close();
            return true;

        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public static ResultSet getResultSet (String sql) {
        StringTokenizer st = new StringTokenizer(sql);
        if (!"SELECT".equalsIgnoreCase(st.nextToken())) return null;

        Connection connection = null;
        Statement statement;

        try {
            Class.forName("org.sqlite.JDBC");
            connection = DriverManager.getConnection("jdbc:sqlite:/" + db);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

        try {
            statement = connection.createStatement();
            return statement.executeQuery(sql);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}

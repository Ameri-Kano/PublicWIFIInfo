package com.amerikano.publicwifiinfo;

import com.google.gson.*;
import okhttp3.*;

public class GetWIFIData {
    public static String responseJson; // API 요청 결과 저장 json String

    // API를 이용하여 WIFI 데이터 가져오기
    public static String getWiFIJsonData(int startIndex, int endIndex) {
        String url = "http://openapi.seoul.go.kr:8088/"
                +GlobalConstant.key+"/json/TbPublicWifiInfo/"+startIndex+"/"+endIndex+"/";

        try {
            OkHttpClient client = new OkHttpClient();
            Request.Builder builder = new Request.Builder().url(url).get();
            Request request = builder.build();
            Response response = client.newCall(request).execute();
            if (response.isSuccessful()) {
                ResponseBody body = response.body();
                if (body != null) {
                    responseJson = body.string();
                    System.out.println(startIndex + " 부터 " + endIndex + "번째 데이터 요청 성공");
                    return responseJson;
                }
            }
            else System.err.println("실패");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "ERROR";
    }

    // 요청으로 받은 json을 java 객체로 변환
    public static PublicWifiInfo convertJsonString(String json) {
        Gson gson = new Gson();
        PublicWifiInfo publicWifiInfo = gson.fromJson(responseJson, PublicWifiInfo.class);

        return publicWifiInfo;
    }
}

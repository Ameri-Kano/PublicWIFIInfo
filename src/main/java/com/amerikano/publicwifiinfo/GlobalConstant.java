package com.amerikano.publicwifiinfo;

import java.util.HashMap;

public class GlobalConstant {
    public static final String key = "API_KEY";
    public static final String appTitle = "서울 공공 WIFI 정보";
    public static final HashMap<String, String> siteTitle = new HashMap<>();

    public static void initHashMap() {
        siteTitle.put("/index.jsp", "서울 공공 WIFI 정보");
        siteTitle.put("/history.jsp", "위치 히스토리 목록");
        siteTitle.put("/detail.jsp", "상세 정보");
        siteTitle.put("/bookmark-list.jsp", "북마크 목록");
        siteTitle.put("/bookmark-group.jsp", "북마크 그룹 관리");
        siteTitle.put("/add-bookmark-group.jsp", "북마크 그룹 추가");
        siteTitle.put("/edit-bookmark-group.jsp", "북마크 그룹 수정");
        siteTitle.put("/delete-bookmark-group.jsp", "북마크 그룹 삭제");
        siteTitle.put("/delete-bookmark.jsp", "북마크 삭제");
    }
}

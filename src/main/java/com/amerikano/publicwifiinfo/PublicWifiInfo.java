package com.amerikano.publicwifiinfo;

import java.util.*;
import com.google.gson.annotations.SerializedName;

public class PublicWifiInfo{
    @SerializedName("TbPublicWifiInfo")
    public InfoTable infoTable;
}

class InfoTable {
    @SerializedName("list_total_count")
    public int totalCount;
    @SerializedName("RESULT")
    public Result result;
    public ArrayList<Row> row;
}

class Result {
    @SerializedName("CODE")
    public String code;
    @SerializedName("MESSAGE")
    public String message;
}

class Row {
    @SerializedName("X_SWIFI_MGR_NO")
    public String mgrNo;
    @SerializedName("X_SWIFI_WRDOFC")
    public String district;
    @SerializedName("X_SWIFI_MAIN_NM")
    public String name;
    @SerializedName("X_SWIFI_ADRES1")
    public String address1;
    @SerializedName("X_SWIFI_ADRES2")
    public String address2;
    @SerializedName("X_SWIFI_INSTL_FLOOR")
    public String installFloor;
    @SerializedName("X_SWIFI_INSTL_TY")
    public String installType;
    @SerializedName("X_SWIFI_INSTL_MBY")
    public String installMBY;
    @SerializedName("X_SWIFI_SVC_SE")
    public String serviceSeparation;
    @SerializedName("X_SWIFI_CMCWR")
    public String communicationType;
    @SerializedName("X_SWIFI_CNSTC_YEAR")
    public String installationYear;
    @SerializedName("X_SWIFI_INOUT_DOOR")
    public String inoutDoor;
    @SerializedName("x_SWIFI_REMARS3")
    public String connectEnv;
    @SerializedName("LAT")
    public double latitude;
    @SerializedName("LNT")
    public double longitude;
    @SerializedName("WORK_DTTM")
    public String workDateTime;

    @Override
    public String toString() {
        return "('" + mgrNo + "'," +
                "'" + district + "'," +
                "'" + name + "'," +
                "'" + address1.replaceAll("'", "") + "'," +
                "'" + address2.replaceAll("'", "") + "'," +
                "'" + installFloor + "'," +
                "'" + installType + "'," +
                "'" + installMBY + "'," +
                "'" + serviceSeparation + "'," +
                "'" + communicationType + "'," +
                "'" + installationYear + "'," +
                "'" + inoutDoor + "'," +
                "'" + connectEnv + "'," +
                longitude + "," +
                latitude + "," +
                "'" + workDateTime + "')";
    }
}



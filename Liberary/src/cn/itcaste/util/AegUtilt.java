package cn.itcaste.util;

import java.sql.Date;

public class AegUtilt {

    public static int Fun1(Date date){
        java.util.Date date1=new java.util.Date(System.currentTimeMillis());

        return date1.getYear()-date.getYear();
    }
}

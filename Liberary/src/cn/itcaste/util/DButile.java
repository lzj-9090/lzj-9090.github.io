package cn.itcaste.util;

import java.sql.*;

public class DButile {
    private static String driver="com.mysql.cj.jdbc.Driver";
    private static String url="jdbc:mysql://localhost:33061/libray2?serverTimezone=GMT%2B8&useSSL=false";
    private static String user="root";
    private static String password="123456";
    static {
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    public static Connection getConn(){
        try {
            return DriverManager.getConnection(url,user,password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    //这是增添删改
    public static boolean exeUpdate(String sql,Object...arg){
        Connection cnn=getConn();
        PreparedStatement ment=null;
        try {
            ment=cnn.prepareStatement(sql);
            for (int i=0;i<arg.length;i++){
                ment.setObject(i+1,arg[i]);
            }
            return ment.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {

            try {
                if (ment!=null) {
                    ment.close();
                }
                if (cnn!=null){
                    cnn.close();

                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    //查找
    public static ResultSet exeQyye(String sql,Object...arg){
        Connection cnn=getConn();
        PreparedStatement ment=null;
        try {
            ment=cnn.prepareStatement(sql);
            for (int i=0;i<arg.length;i++){
                ment.setObject(i+1,arg[i]);
            }
            return ment.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {


        }
        return null;

    }

}


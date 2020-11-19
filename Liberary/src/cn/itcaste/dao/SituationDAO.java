package cn.itcaste.dao;

import cn.itcaste.table.Book;
import cn.itcaste.table.Situation;
import cn.itcaste.util.DButile;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SituationDAO{

    public static ArrayList<Situation> Select1(String email, int a1) {
        String sql="select * from situation where email=? and subscribe=?";
        ArrayList<Situation> list=new ArrayList<>();
        Situation situation=null;
        ResultSet rs= DButile.exeQyye(sql,email,a1);
        try {
            while(rs.next()){
                situation=new Situation();
                situation.setEmail(rs.getString("email"));
                situation.setBookName(rs.getString("bookName"));
                situation.setSubscribe(rs.getInt("subscribe"));
                list.add(situation);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return null;
    }


    public static Situation Select2(String email,String bookName, int a1) {
        String sql="select * from situation where email=? and bookName=? and subscribe=?";
      //  ArrayList<Situation> list=new ArrayList<>();
        Situation situation=null;
        ResultSet rs= DButile.exeQyye(sql,email,bookName,a1);
        try {
            while(rs.next()){
                situation=new Situation();
                situation.setEmail(rs.getString("email"));
                situation.setBookName(rs.getString("bookName"));
                situation.setSubscribe(rs.getInt("subscribe"));
//                list.add(situation);
            }
//            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return situation;
//        return false;
    }

//    @Override
    public static boolean Update(Situation situation,int a1) {
        String sql="update situation set subscribe=? where email=? and bookName=?";
        return DButile.exeUpdate(sql,a1,situation.getEmail(),situation.getBookName());
    }

//    @Override删除
    public static boolean Delete(Situation situation) {
        String sql="delete from situation where email=? and bookName=? and subscribe=?";
        return DButile.exeUpdate(sql,situation.getEmail(),situation.getBookName(),situation.getSubscribe());
    }
    public static boolean Insert(Situation situation){
        String sql="insert situation(email,bookName,subscribe)values(?,?,?)";
        return DButile.exeUpdate(sql,situation.getEmail(),situation.getBookName(),situation.getSubscribe());
    }
}

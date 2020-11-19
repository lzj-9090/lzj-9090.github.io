package cn.itcaste.dao;

import cn.itcaste.table.User;
import cn.itcaste.util.DButile;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * 1.查询所有数据
 * 2.根据office来查询
 * 3.根据email来查询
 * 4.修改user的权限
 * 5.修改密码
 *
 *
 */
public class UserDAO {
    public static ArrayList<User> Select1(){
        User user=null;
        ArrayList<User> list=new ArrayList<>();
        String sql="select * from user";
        ResultSet rs= DButile.exeQyye(sql);
        try {
            while (rs.next()){
                user=new User();
                user.setId(rs.getInt("Id"));
                user.setBirthday(rs.getDate("Birthday"));
                user.setEmail(rs.getString("Email"));
                user.setName(rs.getString("Name"));
                user.setRole(rs.getInt("Role"));
                user.setOffice(rs.getString("Office"));
                user.setPassword(rs.getString("Password"));
                list.add(user);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static User Select2(String email){
        User user=null;
        String sql="select * from user where Email=?";
        ResultSet rs= DButile.exeQyye(sql,email);
        try {
            if(rs.next()){
                user=new User();
                user.setId(rs.getInt("Id"));
                user.setBirthday(rs.getDate("Birthday"));
                user.setEmail(rs.getString("Email"));
                user.setName(rs.getString("Name"));
                user.setRole(rs.getInt("Role"));
                user.setOffice(rs.getString("Office"));
                user.setPassword(rs.getString("Password"));
            }
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static  boolean Insert1(User user) {
        String sql="insert user(Id,Name,Email,Password,Office,Role,Birthday)value(?,?,?,?,?,?,?)";
        boolean b1=DButile.exeUpdate(sql,user.getId(),
                user.getName(),
                user.getEmail(),
                user.getPassword(),
                user.getOffice(),
                user.getRole(),
                user.getBirthday());
        return b1;
    }
    public static boolean UpdatePassword(String email,String pwd){
        String sql="update user set password=? where email=?";
        return DButile.exeUpdate(sql,pwd,email);
    }
}

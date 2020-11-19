package cn.itcaste.dao;

import cn.itcaste.table.Book;
import cn.itcaste.util.DButile;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BookDAO{

    public static ArrayList<Book> Select1() {
        Book book=null;
        ArrayList<Book> list=new ArrayList<Book>();
        String sql="select * from book";
        ResultSet re= DButile.exeQyye(sql);
        try {
            while (re.next()){
                book=new Book();
                book.setId(re.getInt("Id"));
                book.setBookName(re.getString("bookName"));
                book.setBookType(re.getString("bookType"));
                book.setNumber(re.getInt("number"));
                book.setPrice(re.getInt("price"));
                book.setIntroduce(re.getString("introduce"));
                book.setBookAthor(re.getString("bookAthor"));
                list.add(book);
            }
            return list;
           // return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    public static ArrayList<Book> Select2(String type) {
        Book book=null;
        ArrayList<Book> list=new ArrayList<Book>();
        String sql="select * from book where type=?";
        ResultSet re= DButile.exeQyye(sql,type);
        try {
            while (re.next()){
                book=new Book();
                book.setId(re.getInt("Id"));
                book.setBookName(re.getString("bookName"));
                book.setBookType(re.getString("bookType"));
                book.setNumber(re.getInt("number"));
                book.setPrice(re.getInt("price"));
                book.setIntroduce(re.getString("introduce"));
                book.setBookAthor(re.getString("bookAthor"));
                list.add(book);
            }

            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
       return null;
    }


    public static Book Select3(int id) {
        Book book=null;
        String sql="select * from book where Id=?";
        ResultSet re= DButile.exeQyye(sql,id);
        try {
            while (re.next()){
                book=new Book();
                book.setId(re.getInt("Id"));
                book.setBookName(re.getString("bookName"));
                book.setBookType(re.getString("bookType"));
                book.setNumber(re.getInt("number"));
                book.setPrice(re.getInt("price"));
                book.setIntroduce(re.getString("introduce"));
                book.setBookAthor(re.getString("bookAthor"));
            }
            return book;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    public static Book Select4(String bookName) {
        Book book=null;
        String sql="select * from book where bookName=?";
        ResultSet re= DButile.exeQyye(sql,bookName);
        try {
            while (re.next()){
                book=new Book();
                book.setId(re.getInt("Id"));
                book.setBookName(re.getString("bookName"));
                book.setBookType(re.getString("bookType"));
                book.setNumber(re.getInt("number"));
                book.setPrice(re.getInt("price"));
                book.setIntroduce(re.getString("introduce"));
                book.setBookAthor(re.getString("bookAthor"));

            }
            return book;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    public static boolean delect(int id) {
        String sql="delete from book where Id=?";
        return  DButile.exeUpdate(sql,id);
    }

//    修改书的数目
    public static boolean Update1(String bookName, int number) {
        String sql="update book set number=? where bookName=?";
        return DButile.exeUpdate(sql,number,bookName);
    }
}

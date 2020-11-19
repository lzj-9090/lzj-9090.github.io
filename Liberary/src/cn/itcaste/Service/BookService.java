package cn.itcaste.Service;

import cn.itcaste.ServiceTable.Mole;
import cn.itcaste.dao.BookDAO;
import cn.itcaste.dao.SituationDAO;
import cn.itcaste.dao.UserDAO;
import cn.itcaste.table.Book;
import cn.itcaste.table.Situation;
import cn.itcaste.table.User;
import cn.itcaste.util.DButile;

import java.util.ArrayList;

public class BookService {
//这个是输出全部书籍
    public static ArrayList<Book> SelectBook(String bookName){
        ArrayList<Book> list=new ArrayList<Book>();
        Book book=new Book();
        if (bookName==null){
            list= BookDAO.Select1();
        }else {
            book=BookDAO.Select4(bookName);
            list.add(book);
        }
        return list;
    }
    //这个是收藏和订阅的书籍
    public static ArrayList<Book> SelectBook2(String email,int a1){
        ArrayList<Situation> situations=SituationDAO.Select1(email,a1);
        Book book=null;
        ArrayList<Book> list=new ArrayList<>();
        for (Situation s1:situations) {
            book=BookDAO.Select4(s1.getBookName());
            list.add(book);
        }
        return list;
    }
    /**
     * 密码修改选项
     */
    public static Mole UpdatePassword(String email,String password,String pwd){
        User user=UserDAO.Select2(email);
        Mole mole=new Mole();
        if(password.equals(user.getPassword())){
            if (UserDAO.UpdatePassword(email,pwd)){
                mole.setChuan("修改成功");
            }else{
                mole.setChuan("修改失败");
            }
        }else {
            mole.setChuan("输入旧密码错误");
        }
        return mole;
    }
}

package cn.itcaste.test.DAO;

import cn.itcaste.dao.BookDAO;
import cn.itcaste.table.Book;
import org.junit.Test;

import java.util.ArrayList;

public class BookDAOTest {

    @Test
    public void testSelect1(){
        BookDAO bookDAO=new BookDAO();
        ArrayList<Book> list= bookDAO.Select1();
        for (Book s1:list) {
            System.out.println(s1.getBookName()+","+s1.getBookAthor());
        }
    }
}

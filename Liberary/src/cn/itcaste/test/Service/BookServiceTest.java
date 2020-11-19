package cn.itcaste.test.Service;

import cn.itcaste.Service.BookService;
import cn.itcaste.ServiceTable.Mole;
import cn.itcaste.table.Book;
import org.junit.Test;

import java.util.ArrayList;

public class BookServiceTest {
    @Test
    public void testUserBook(){
        ArrayList<Book> list= BookService.SelectBook2("1234@qq.com",1);
        for (Book b1:list){
            System.out.println(b1.getBookAthor());
        }
    }
    @Test
    public void testPassword(){
        Mole mole=BookService.UpdatePassword("1234@qq.com","123","1234");
        System.out.println(mole.getChuan());
    }
}

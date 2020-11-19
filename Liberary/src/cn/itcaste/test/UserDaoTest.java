package cn.itcaste.test;

import cn.itcaste.dao.UserDAO;
import cn.itcaste.table.User;
import org.junit.Test;

import java.util.ArrayList;

public class UserDaoTest {
    @Test
    public void testSelect1(){
        ArrayList<User> list= UserDAO.Select1();
        for (User u1:list) {
            System.out.println(u1.getEmail());
        }

    }
}

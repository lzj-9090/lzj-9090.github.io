package cn.itcaste.test.DAO;

import cn.itcaste.dao.SituationDAO;
import cn.itcaste.table.Situation;
import org.junit.Test;

import java.util.ArrayList;

public class SituationDAOTest {
    @Test
    public void testSelect1(){
        ArrayList<Situation> list= cn.itcaste.dao.SituationDAO.Select1("1234@qq.com",0);
        for (Situation s1:list){
            System.out.println(s1.getBookName());
        }
    }
    @Test
    public void testSelect2(){
        Situation situation= SituationDAO.Select2("1234@qq.com","《西游记》",0);
        System.out.println(situation==null);
    }
}

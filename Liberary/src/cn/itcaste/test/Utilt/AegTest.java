package cn.itcaste.test.Utilt;

import cn.itcaste.util.AegUtilt;
import org.junit.Test;

import java.sql.Date;

public class AegTest {
    @Test
    public void testAag(){
        String p1="1978-2-8";
        Date date=Date.valueOf(p1);
        System.out.println(AegUtilt.Fun1(date));
    }
}

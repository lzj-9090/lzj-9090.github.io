package cn.itcaste.test.Service;

import cn.itcaste.Service.BootFunction;
import cn.itcaste.ServiceTable.Mole;
import cn.itcaste.table.Situation;
import org.junit.Test;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.time.Month;

public class BookFunctionTest {


    @Test
    public void Fun1test(){
//        Situation situation=new Situation("1234@qq.com","《三国》",0);
//        Mole mole= BootFunction.NotRepeat(situation);
//        System.out.println(mole.getChuan());
        try {
            Class clazz=Class.forName("cn.itcaste.table.Situation");
//            Situation situation= (Situation) clazz.newInstance();
            Constructor<Situation> constructor=clazz.getConstructor(String.class,String.class,int.class);
            constructor.setAccessible(true);
            Situation situation=constructor.newInstance("1234@qq.com","《三国》",0);
            System.out.println(situation.getBookName());
           // Class clazz2=Class.forName("cn.itcaste.ServiceTable.Mole");
            Class clazz3=Class.forName("cn.itcaste.Service.BootFunction");
            BootFunction boot= (BootFunction) clazz3.newInstance();
            Method method=clazz3.getMethod("NotRepeat", Situation.class);
            method.setAccessible(true);
            Mole mole= (Mole) method.invoke(method,situation);
            System.out.println(mole.getChuan());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @Test
    public void testDelete(){
//        Mole mole=BootFunction.CollectionButton(new Situation( "1234@qq.com","《三国》",0));
////        System.out.println(mole.getChuan());
       // Mole mole=BootFunction.DeleteCollection(new Situation( "1234@qq.com","《三国》",0));
        try {
            Class clazz=Class.forName("cn.itcaste.Service.BootFunction");
            BootFunction bootFunction= (BootFunction) clazz.newInstance();
            Method method=clazz.getMethod("DeleteCollection", Situation.class);

            Class clazz2=Class.forName("cn.itcaste.table.Situation");
            Constructor constructor=clazz.getConstructor(String.class,String.class,int.class);
            constructor.setAccessible(true);
            Situation situation= (Situation) constructor.newInstance("1234@qq.com","《三国》",0);

//            Constructor constructor=clazz2.getConstructor("")

        } catch (Exception e) {
            e.printStackTrace();
        }


        //    System.out.println();
    }
}

package cn.itcaste.test.Service;

import cn.itcaste.Service.LoginService;
import cn.itcaste.ServiceTable.Mole;
import cn.itcaste.ServiceTable.User2;
import org.junit.Test;

public class LoginServiceTest {
    @Test
    public void testLogin(){
        User2 user2=new User2("","1234@qq.com","123");

        Mole mole= LoginService.Login(user2);
        System.out.println(mole.getChuan());
    }
}

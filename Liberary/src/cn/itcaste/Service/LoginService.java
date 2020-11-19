package cn.itcaste.Service;

import cn.itcaste.ServiceTable.Mole;
import cn.itcaste.ServiceTable.User2;
import cn.itcaste.dao.UserDAO;
import cn.itcaste.table.User;

public class LoginService {
    /**
     * 用户登录
     */
    public static Mole Login(User2 user2){
        Mole mole=new Mole();
        User user= UserDAO.Select2(user2.getEmail());
        if (user!=null){
            if (user.getPassword().equals(user2.getPassword())){
                if (user.getRole()==1){
                    if (user.getOffice().equals("user")){
                        mole.setZhi("user");

                    }
                    mole.setPan(true);

                }else {
                    mole.setChuan("你已经被列入黑名单");

                }
            }else {
                mole.setChuan("密码错误！！");
            }

        }else {
            mole.setChuan("该账户不存在");
        }
        return mole;
    }
}

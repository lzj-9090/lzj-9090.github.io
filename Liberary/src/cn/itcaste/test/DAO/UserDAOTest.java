package cn.itcaste.test.DAO;

import cn.itcaste.dao.UserDAO;
import cn.itcaste.table.User;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

public class UserDAOTest {
    @Test
    public void testSelect2() throws JsonProcessingException {
        User user= UserDAO.Select2("123@qq.com");
        Map<String,Object> map=new HashMap<>();
        if (user==null){
            map.put("flag",true);
        }else {
            map.put("flag",false);
        }
        ObjectMapper mapper=new ObjectMapper();
        String p1=mapper.writeValueAsString(map);
        System.out.println(p1);
    }
}

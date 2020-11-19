package cn.Servlet;

import cn.itcaste.dao.UserDAO;
import cn.itcaste.table.User;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email=request.getParameter("email");
        User user=UserDAO.Select2(email);
        System.out.println(user);
        Map<String,Object> p1=new HashMap<String, Object>();
        if (user==null){
            p1.put("flag",true);
        }else {
            p1.put("flag",false);
        }
        System.out.println(p1.get("flag"));
        ObjectMapper obj=new ObjectMapper();
        String p2=obj.writeValueAsString(p1);
        response.getWriter().write(p2);
    }
}

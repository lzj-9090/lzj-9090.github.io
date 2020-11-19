package cn.Servlet;

import cn.itcaste.Service.BookService;
import cn.itcaste.ServiceTable.Mole;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/passwordServlet")
public class PasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String pwd = request.getParameter("password1");
        String pwd2 = request.getParameter("password2");
        System.out.println(pwd);
        Cookie[] cookies=request.getCookies();
        for (Cookie c1:cookies){
            if (c1.getName().equals("email")){
                Mole mole= BookService.UpdatePassword(c1.getValue(),pwd,pwd2);
                ObjectMapper mapper=new ObjectMapper();
                //传值返回界面
                System.out.println(pwd+"密码2"+pwd2);
                mapper.writeValue(response.getWriter(),mole);
            }
    }
    }
}

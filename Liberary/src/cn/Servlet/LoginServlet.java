package cn.Servlet;

import cn.itcaste.Service.LoginService;
import cn.itcaste.ServiceTable.Mole;
import cn.itcaste.ServiceTable.User2;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
           String email=request.getParameter("email");
           String password=request.getParameter("password");
           User2 user2=new User2("",email,password);
           //利用JsckSon
           Mole mole= LoginService.Login(user2);
           ObjectMapper mapper=new ObjectMapper();
           //传值
            mapper.writeValue(response.getWriter(),mole);
    }
}

package cn.Servlet;

import cn.itcaste.dao.UserDAO;
import cn.itcaste.table.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/doUserServlet")
public class doUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie[] cookie=request.getCookies();
        for(Cookie c1:cookie){
            if (c1.getName().equals("email")){
                User user= UserDAO.Select2(c1.getValue());
                request.setAttribute("User",user);
                request.getRequestDispatcher("User.jsp").forward(request,response);
            }
        }
    }
}

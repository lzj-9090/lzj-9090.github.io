package cn.Servlet;

import cn.itcaste.Service.LoginService;
import cn.itcaste.ServiceTable.Mole;
import cn.itcaste.ServiceTable.User2;
import cn.itcaste.dao.BookDAO;
import cn.itcaste.table.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/BookUIServlet")
public class BookUIServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out=response.getWriter();
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        Mole mole= LoginService.Login(new User2("",email,password));
        if (mole.isPan()) {
            Cookie cookie = new Cookie("email", email);
            //cookie.setPath("/");
            response.addCookie(cookie);
            request.getRequestDispatcher("Navigation.jsp").forward(request, response);
        }else {
            out.println("<script>alert('"+mole.getChuan()+"');history.back();</script>");
        }
    }
}

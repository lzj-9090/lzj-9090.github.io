package cn.Servlet;

import cn.itcaste.Service.BookService;
import cn.itcaste.table.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/UserBookServlet")
public class UserBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /**
         * 这个是收藏和购买信息
         */
        String eamil="";
        String id1=request.getParameter("id");
        int id=Integer.valueOf(id1).intValue();
        Cookie[] cookies=request.getCookies();
        if (cookies!=null) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("email")){
                   // eamil=cookies[i].getValue();
                    ArrayList<Book> list= BookService.SelectBook2(cookies[i].getValue(),id);
                    request.setAttribute("list",list);
                    if(id==0) {
                        request.getRequestDispatcher("Collection.jsp").forward(request, response);
                    }else {
                        request.getRequestDispatcher("UserSub.jsp").forward(request, response);
                    }
            }
            }
        }
        //System.out.println(eamil);


    }
}

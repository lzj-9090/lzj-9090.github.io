package cn.Servlet;

import cn.itcaste.Service.BookService;
import cn.itcaste.Service.LoginService;
import cn.itcaste.ServiceTable.Mole;
import cn.itcaste.ServiceTable.User2;
import cn.itcaste.dao.UserDAO;
import cn.itcaste.table.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/doBookServlet")
public class doBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            String bookName = request.getParameter("bookName");
            ArrayList<Book> list = BookService.SelectBook(bookName);
            request.setAttribute("list", list);
            request.getRequestDispatcher("/doBook.jsp").forward(request, response);

    }
}

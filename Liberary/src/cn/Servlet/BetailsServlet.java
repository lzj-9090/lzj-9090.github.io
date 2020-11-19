package cn.Servlet;

import cn.itcaste.dao.BookDAO;
import cn.itcaste.table.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/retailsServlet")
public class BetailsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String id=request.getParameter("id");
       // String id="1";
        Book book= BookDAO.Select3(Integer.valueOf(id).intValue());
        request.setAttribute("Book",book);
        request.getRequestDispatcher("BookRetails.jsp").forward(request,response);
    }
}

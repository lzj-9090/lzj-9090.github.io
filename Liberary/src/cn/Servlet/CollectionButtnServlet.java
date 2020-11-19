package cn.Servlet;

import cn.itcaste.Service.BootFunction;
import cn.itcaste.ServiceTable.Mole;
import cn.itcaste.table.Situation;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/collectionButtnServlet")
public class CollectionButtnServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String bookName2 = request.getParameter("bookName");
        String d1=request.getParameter("id");
        Cookie[] cookies1 = request.getCookies();
        for (Cookie c1 : cookies1) {
            if (c1.getName().equals("email")) {
                Mole mole = BootFunction.DeleteCollection(new Situation(c1.getValue(),bookName2,Integer.valueOf(d1).intValue()));
                ObjectMapper mapper = new ObjectMapper();
                mapper.writeValue(response.getWriter(), mole);
            }
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String bookName=request.getParameter("bookName");
        Cookie[] cookies=request.getCookies();
        for (Cookie c1:cookies){
            if (c1.getName().equals("email")){
                Mole mole= BootFunction.CollectionButton(new Situation(c1.getValue(),bookName,0));
                ObjectMapper mapper=new ObjectMapper();
                mapper.writeValue(response.getWriter(),mole);
            }
        }
    }
}

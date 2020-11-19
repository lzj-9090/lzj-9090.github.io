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

@WebServlet("/ButtonServlet")
public class ButtonServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
      String id=request.getParameter("id");//判断是否收藏或订购
      String bookName=request.getParameter("bookName");
//        String id="1";
//        String bookName="《水浒》";
      System.out.println(id+bookName);
      Cookie[] cookies=request.getCookies();
      for (Cookie cookie:cookies){
           if (cookie.getName().equals("email")){
               Situation situation=new Situation(cookie.getValue(),bookName,Integer.valueOf(id).intValue());
               Mole mole= BootFunction.NotRepeat(situation);
               ObjectMapper mapper=new ObjectMapper();
               mapper.writeValue(response.getWriter(),mole);

           }
      }

    }
}

package sist.action;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

public class IndexAction implements Action {

  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) {
   HttpSession session = request.getSession();

   String  nickname = (String) session.getAttribute("nickname");


   if(nickname == null){

     request.setAttribute("isLoggedIn", false);
   }

    return "index.jsp";
  }

}

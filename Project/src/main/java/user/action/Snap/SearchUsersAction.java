package user.action.Snap;

import user.action.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SearchUsersAction implements Action {
  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
    String query = request.getParameter("query");
    System.out.println("query: " + query);


    return "";
  }
}

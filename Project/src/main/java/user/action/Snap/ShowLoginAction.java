package user.action.Snap;

import user.action.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ShowLoginAction implements Action {

  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) {

    return "user/jsp/login/login.jsp";
  }
}

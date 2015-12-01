package wham.core;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			User user=new User();
			user.setEmailId(request.getParameter("emailId"));
			user.setFirstName(request.getParameter("firstName"));
			user.setLastName(request.getParameter("lastName"));
			user.setPerference(request.getParameter("preferences"));
			user.setPassword(request.getParameter("password"));
			user.setUserName(request.getParameter("userName"));
			user.setCity(request.getParameter("city"));
			
			// Need to validate input here;
			
			UserDAO.registerUser(user);
			response.sendRedirect("Login.jsp"); //logged-in page      		
}
	catch(Exception e){
		System.out.println(e);
	}

	response.getWriter().append("Served at: ").append(request.getContextPath());
}
	}


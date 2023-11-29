package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.connection.DbCon;
import com.models.User;

import doa.UserDoa;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("index.jsp");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			// System.out.println("user logged in");
			String email = request.getParameter("login-email");
			String password = request.getParameter("login-password");
			try {
				UserDoa userDoa = new UserDoa(DbCon.getConnection());
				User user = userDoa.userLogin(email, password);
				if (user != null) {
					request.getSession().setAttribute("auth", user);

				} else {
					out.println("There is no user");
				}
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}

		}
	}

}

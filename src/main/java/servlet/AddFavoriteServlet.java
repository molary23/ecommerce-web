package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.connection.DbCon;
import com.models.Favorite;
import com.models.User;

import doa.FavoriteDoa;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/add-favorite")
public class AddFavoriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {
			// out.print("this buy now servlet");

			User auth = (User) request.getSession().getAttribute("auth");

			if (auth != null) {
				String productId = request.getParameter("id");

				Favorite fave = new Favorite();
				fave.setId(Integer.parseInt(productId));
				fave.setUid(auth.getId());

				FavoriteDoa faveDoa = new FavoriteDoa(DbCon.getConnection());
				faveDoa.addFavorite(fave);
				// response.sendRedirect("index.jsp");
				response.sendRedirect(request.getHeader("referer"));
			}

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

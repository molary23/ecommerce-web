package doa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.models.User;

public class UserDoa {
	private Connection con;

	private String query;
	private PreparedStatement pst;
	private ResultSet rs;

	public UserDoa(Connection con) {
		this.con = con;
	}

	public User userLogin(String email, String password) {
		User user = null;

		try {
			query = "SELECT * FROM users WHERE email=? and password=?";
			pst = this.con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			rs = pst.executeQuery();

			if (rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
			}
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		}
		return user;
	}
}

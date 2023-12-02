package doa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.models.Favorite;
import com.models.Product;

public class FavoriteDoa {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet res;

	public FavoriteDoa(Connection con) {
		this.con = con;
	}

	public boolean addFavorite(Favorite favorite) {
		boolean result = false;
		try {
			query = "INSERT INTO favorite(p_id, u_id)values(?,?)";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, favorite.getId());
			pst.setInt(2, favorite.getUid());
			pst.executeUpdate();
			result = true;

		} catch (Exception e) {
			e.printStackTrace();

		}
		return result;
	}

	public boolean removeFavorite(int productId, int userId) {
		boolean result = false;
		try {
			query = "DELETE FROM favorite WHERE p_id = ? AND u_id = ?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, productId);
			pst.setInt(2, userId);
			pst.executeUpdate();
			result = true;

		} catch (Exception e) {
			e.printStackTrace();

		}
		return result;
	}

	public List<Favorite> getAllUserFavorites(int id) {
		List<Favorite> list = new ArrayList<>();
		try {

			query = "SELECT * FROM favorite WHERE u_id = ? ORDER BY favorite.id DESC";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			res = pst.executeQuery();
			while (res.next()) {
				Favorite favorite = new Favorite();
				ProductDoa productDoa = new ProductDoa(this.con);
				int pId = res.getInt("p_id");

				Product product = productDoa.getSingleProduct(pId);
				favorite.setFid(res.getInt("id"));
				favorite.setId(pId);
				favorite.setName(product.getName());
				favorite.setCategory(product.getCategory());
				favorite.setPrice(product.getPrice());
				favorite.setDate(res.getString("createdAt"));
				list.add(favorite);

			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

		return list;
	}
}

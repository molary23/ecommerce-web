package doa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.models.Cart;
import com.models.Product;

public class ProductDoa {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet res;

	public ProductDoa(Connection con) {
		this.con = con;
	}

	public List<Product> getAllProducts() {
		List<Product> products = new ArrayList<Product>();
		try {
			query = "SELECT * FROM products";
			pst = this.con.prepareStatement(query);
			res = pst.executeQuery();
			while (res.next()) {
				Product row = new Product();
				row.setId(res.getInt("id"));
				row.setName(res.getString("name"));
				row.setCategory(res.getString("category"));
				row.setImage(res.getString("image"));
				row.setPrice(res.getDouble("price"));

				products.add(row);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}

	public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
		List<Cart> products = new ArrayList<Cart>();

		try {
			if (cartList.size() > 0) {
				for (Cart item : cartList) {
					query = "SELECT * FROM products WHERE id=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					res = pst.executeQuery();
					while (res.next()) {
						Cart row = new Cart();
						row.setId(res.getInt("id"));
						row.setName(res.getString("name"));
						row.setCategory(res.getString("category"));
						row.setImage(res.getString("image"));
						row.setPrice(res.getDouble("price") * item.getQuantity());
						row.setQuantity(item.getQuantity());
						products.add(row);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return products;
	}

	public double getTotalCartPrice(ArrayList<Cart> cartList) {
		double sum = 0;
		try {
			if (cartList.size() > 0) {
				for (Cart item : cartList) {
					query = "SELECT price FROM products WHERE id=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					res = pst.executeQuery();
					while (res.next()) {
						sum += res.getDouble("price") * item.getQuantity();
					}

				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return sum;
	}

	public Product getSingleProduct(int id) {
		Product row = null;
		try {
			query = "SELECT * FROM products WHERE id = ?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			res = pst.executeQuery();
			while (res.next()) {
				row = new Product();
				row.setId(res.getInt("id"));
				row.setName(res.getString("name"));
				row.setCategory(res.getString("category"));
				row.setImage(res.getString("image"));
				row.setPrice(res.getDouble("price"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return row;

	}
}
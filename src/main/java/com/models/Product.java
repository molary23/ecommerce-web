package com.models;

public class Product {
	private int id;
	private String name, category, image;
	private Double price;

	public Product() {
	}

	public Product(int id, String name, String category, String image, Double price) {
		super();
		this.id = id;
		this.name = name;
		this.category = category;
		this.image = image;
		this.price = price;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", category=" + category + ", image=" + image + ", price="
				+ price + "]";
	}

}

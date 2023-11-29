package com.models;

public class Favorite extends Product {

	private int fid;
	private int uid;
	private String date;

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Favorite(int fid, int uid, String date) {
		super();
		this.fid = fid;
		this.uid = uid;
		this.date = date;
	}

	public Favorite() {

	}

}

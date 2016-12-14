package com.entity;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class Goods {

	
	private int id;
	private String product_Name;
	private BigDecimal unit_Price;
	private String content;
	private String images;
	private Date create_time;
	private int Reserves;
	private String title;
	private GoodsType goodstype;
	private List<Color> colors;
	private List<Size> sizes;
	
	
	public String getProduct_Name() {
		return product_Name;
	}
	public void setProduct_Name(String productName) {
		product_Name = productName;
	}
	public BigDecimal getUnit_Price() {
		return unit_Price;
	}
	public void setUnit_Price(BigDecimal unitPrice) {
		unit_Price = unitPrice;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date createTime) {
		create_time = createTime;
	}
	public int getReserves() {
		return Reserves;
	}
	public void setReserves(int reserves) {
		Reserves = reserves;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public GoodsType getGoodstype() {
		return goodstype;
	}
	public void setGoodstype(GoodsType goodstype) {
		this.goodstype = goodstype;
	}
	public List<Color> getColors() {
		return colors;
	}
	public void setColors(List<Color> cList) {
		this.colors = cList;
	}
	public List<Size> getSizes() {
		return sizes;
	}
	public void setSizes(List<Size> sizes) {
		this.sizes = sizes;
	}
	
	
	
}

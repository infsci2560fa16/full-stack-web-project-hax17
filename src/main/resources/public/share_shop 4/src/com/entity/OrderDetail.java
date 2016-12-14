package com.entity;

public class OrderDetail {
	
	private String orderId;
	private String recipients;
	private String address;
	private String tel;
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getRecipients() {
		return recipients;
	}
	public void setRecipients(String recipients) {
		this.recipients = recipients;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	/*public static void main(String[] args) {
		System.out.println(UUID.randomUUID().toString().replaceAll("-","").substring(16));
	}*/

}

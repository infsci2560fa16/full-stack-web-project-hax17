package com.dao;

import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.List;

import com.entity.*;

public class Cart_db extends DB {
	/*
	 * 订单详情
	 */
	public List<Cart> getCartList(String sql, List<Object> params) {

		List<Cart> ct_list = new ArrayList<Cart>();
		try {
			if (conn.isClosed())
				conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			if (params != null)
				for (int i = 0; i < params.size(); i++) {

					pstmt.setObject(i + 1, params.get(i));

				}

			rs = pstmt.executeQuery();

			while (rs.next()) {

				
				Cart cart = new Cart();
				cart.setId(rs.getInt("id"));
				cart.setQUATITY(rs.getInt("QUATITY"));
				cart.setCreate_time(rs.getDate("create_time"));
				cart.setStatus(rs.getInt("status"));
				cart.setContent(rs.getString("content"));


				User user = new User_db().getUser("SELECT * FROM user_table WHERE ID="+rs.getInt("user_id"), null);
				cart.setUser(user);
				
				Goods goods = new Goods_db().getGoods("SELECT * FROM goods_table WHERE ID="+rs.getInt("goods_id"), null);
				cart.setGoods(goods);

				Color color = new Goods_db().getColor("SELECT * FROM color_table WHERE ID="+rs.getInt("color_id"), null);
				cart.setColor(color);
				
				Size size = new Goods_db().getSize("SELECT * FROM size_table WHERE ID="+rs.getInt("size_id"), null);
				cart.setSize(size);
				
				cart.setOrderId(rs.getString("order_id"));
				
				ct_list.add(cart);
			}

		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			close();
		}
		return ct_list;
	}
	
	public Cart getCart(String sql, List<Object> params) {
		Cart cart = null;
		List<Cart> ct_list = getCartList(sql, params);
		if (ct_list != null && ct_list.size() > 0)
			cart = ct_list.get(0);
		return cart;
	}
	
	
}

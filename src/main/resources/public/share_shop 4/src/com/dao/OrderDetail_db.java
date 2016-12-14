package com.dao;

import java.sql.DriverManager;
import java.util.List;

import com.entity.OrderDetail;

public class OrderDetail_db extends DB {
	/*
	 * 订单的详细信息
	 */
	public OrderDetail getOrderDetail(String sql, List<Object> params) {
		OrderDetail qd = new OrderDetail();
		try {
			if (conn.isClosed())
				conn = DriverManager.getConnection(url, user, password);//
			pstmt = conn.prepareStatement(sql);//预编译
			//占位符赋值
			if (params != null)
				for (int i = 0; i < params.size(); i++) {
					pstmt.setObject(i + 1, params.get(i));
				}

			rs = pstmt.executeQuery();
			while (rs.next()) {
				qd.setRecipients(rs.getString("recipients"));
				qd.setOrderId(rs.getString("order_id"));
				qd.setTel(rs.getString("tel"));
				qd.setAddress(rs.getString("address"));
			}

		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			close();
		}
		return qd;
	}
}

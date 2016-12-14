package com.dao;

import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.List;

import com.entity.Address;

public class Address_db extends DB {
	/*
	 * 地址
	 */
	public List<Address> getAddressList(String sql, List<Object> params) {

		List<Address> add_list = new ArrayList<Address>();
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
				
				Address add = new Address();
				add.setAddress(rs.getString("address"));
				add.setRecipients(rs.getString("recipients"));
				add.setTel(rs.getString("tel"));
				
				add_list.add(add);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return add_list;
	}
}

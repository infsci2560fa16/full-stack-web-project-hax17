package com.dao;

import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.List;

import com.entity.*;

public class User_db extends DB {
	/*
	 * 
	 * 
	 * 用户
	 * 
	 * 
	 */
	public List<User> getUserList(String sql, List<Object> params) {

		List<User> lsu = new ArrayList<User>();
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

				User u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				lsu.add(u);
			}

		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			close();
		}
		return lsu;
	}
	
	public User getUser(String sql, List<Object> params) {
		User u = null;
		List<User> lsu = getUserList(sql, params);
		if (lsu != null && lsu.size() > 0)
			u = lsu.get(0);
		return u;
	}
	/*
	 * 
	 * 
	 * 用户
	 * 
	 * 
	 */
}

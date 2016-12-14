package com.dao;

import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.List;

import com.entity.*;

public class Goods_db extends DB {
	/*
	 *  商品
	 */
	public List<Goods> getGoodsList(String sql, List<Object> params) {

		List<Goods> g_list = new ArrayList<Goods>();
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

				Goods g = new Goods();
				g.setId(rs.getInt("id"));
				g.setProduct_Name(rs.getString("Product_Name"));
				g.setUnit_Price(rs.getBigDecimal("Unit_Price"));
				g.setContent(rs.getString("content"));
				g.setImages(rs.getString("images"));
				g.setCreate_time(rs.getDate("create_time"));
				g.setReserves(rs.getInt("Reserves"));
				g.setTitle(rs.getString("title"));
				GoodsType goodstype = new Goods_db().getGoodsType("SELECT * FROM goods_type_table WHERE ID="+rs.getInt("type_id"), null);
				g.setGoodstype(goodstype);
				List<Color> c_list = new Goods_db().getColorList("SELECT * FROM color_table WHERE goods_id="+rs.getInt("id"), null);
				g.setColors(c_list);
				List<Size> s_list = new Goods_db().getSizeList("SELECT * FROM size_table WHERE goods_id="+rs.getInt("id"), null);
				g.setSizes(s_list);
				
				g_list.add(g);
			}

		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			close();
		}
		return g_list;
	}
	
	
	public List<Color> getColorList(String sql, List<Object> params) {

		List<Color> c_list = new ArrayList<Color>();
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

				Color g = new Color();
				g.setId(rs.getInt("id"));
				g.setColor_name(rs.getString("color_name"));
				
				c_list.add(g);
			}

		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			close();
		}
		return c_list;
	}
	
	
	public List<Size> getSizeList(String sql, List<Object> params) {

		List<Size> s_list = new ArrayList<Size>();
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

				Size g = new Size();
				g.setId(rs.getInt("id"));
				g.setSize_name(rs.getString("size_name"));
				
				s_list.add(g);
			}

		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			close();
		}
		return s_list;
	}

	public Goods getGoods(String sql, List<Object> params) {
		Goods goods = null;
		List<Goods> g_list = getGoodsList(sql, params);
		if (g_list != null && g_list.size() > 0)
			goods = g_list.get(0);
		return goods;
	}
	public Color getColor(String sql, List<Object> params) {
		Color color = null;
		List<Color> c_list = getColorList(sql, params);
		if (c_list != null && c_list.size() > 0)
			color = c_list.get(0);
		return color;
	}
	public Size getSize(String sql, List<Object> params) {
		Size size = null;
		List<Size> s_list = getSizeList(sql, params);
		if (s_list != null && s_list.size() > 0)
			size = s_list.get(0);
		return size;
	}
	
	
	
	public List<GoodsType> getGoodsTypeList(String sql, List<Object> params) {

		List<GoodsType> gt_list = new ArrayList<GoodsType>();
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

				GoodsType g = new GoodsType();
				g.setId(rs.getInt("id"));
				g.setGoods_type_name(rs.getString("goods_type_name"));
				g.setContent(rs.getString("content"));
				g.setParent_id(rs.getInt("parent_id"));
				gt_list.add(g);
			}

		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			close();
		}
		return gt_list;
	}
	
	public GoodsType getGoodsType(String sql, List<Object> params) {
		GoodsType goodsType = null;
		List<GoodsType> gt_list = getGoodsTypeList(sql, params);
		if (gt_list != null && gt_list.size() > 0)
			goodsType = gt_list.get(0);
		return goodsType;
	}
}

package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.dao.Address_db;
import com.dao.Cart_db;
import com.dao.Goods_db;
import com.dao.OrderDetail_db;
import com.dao.User_db;
import com.entity.*;
//import com.sun.xml.internal.txw2.Document;

public class QTServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public QTServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String uri = request.getServletPath();
		System.out.println(uri);
		uri = uri.substring(1, uri.lastIndexOf('.'));
		
		/*
		 * 用户管理
		 * 
		 * */
		if(uri.equals("login")){
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			List<Object> list = new ArrayList<Object>();
			
			list.add(username);
			list.add(password);
			
			User user = new User_db().getUser("SELECT * FROM USER_TABLE WHERE USERNAME=? AND PASSWORD=? AND TYPE=1",list);

			if (user != null) {
				System.out.println(user.getId());
				List<Cart> cart = new Cart_db().getCartList("SELECT * FROM order_table where status=0 and user_id = '"+user.getId()+"'",null);
				request.getSession().setAttribute("user", user);
				request.getSession().setAttribute("cart", cart);
				request.getSession().setAttribute("cart_num", cart.size());
				//response.sendRedirect("user.AdminServlet");
				request.getRequestDispatcher("index.jsp").forward(request,
						response);
			
			} else {
				request.setAttribute("message", "Please login again!");
				request.getRequestDispatcher("login.jsp").forward(request,
						response);
			}
		}else if(uri.equals("changepwd")){
			
			User user = (User)request.getSession().getAttribute("user");
			List<Object> list = new ArrayList<Object>();

			String password = request.getParameter("password");
			
			list.clear();
			list.add(password);
			list.add(user.getId());
			String sql = "UPDATE user_table SET password=? WHERE ID=?";
			int result = new User_db().ExecuteSql(sql, list);
			if(result>0){
				request.getSession().setAttribute("user", null);
				request.getSession().setAttribute("cart", null);
				request.getSession().setAttribute("cart_num",null);
				request.getRequestDispatcher("login.jsp").forward(request,
						response);
			} else {

				request.getRequestDispatcher("changepwd.jsp").forward(request,
						response);
			}
		}else if(uri.equals("addUser")){
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String rtpassword = request.getParameter("rtpassword");
			System.out.println(username);
			System.out.println(password);
			System.out.println(rtpassword);
			if (!password.equals(rtpassword)) {
				request.getRequestDispatcher("regist.jsp").forward(request,
						response);
			
			} else{
				List<Object> list = new ArrayList<Object>();
				list.add(username);
				list.add(password);
				String sql = "INSERT INTO USER_TABLE(USERNAME,PASSWORD,TYPE) VALUES(?,?,1)";
				int result = new User_db().ExecuteSql(sql, list);
				if(result>=1){
					request.setAttribute("message", "Register Successfully!");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}else{
					
					request.setAttribute("message", "Register Failed!");
					request.getRequestDispatcher("regist.jsp").forward(request, response);
				}
			}
		}else if(uri.equals("goods")){

			String type = request.getParameter("type");
			List<Object> list = new ArrayList<Object>();
			list.add(type);

			List<Goods> g_list ;
			if(type==null||type.equals("")){
				g_list = new Goods_db().getGoodsList("SELECT * FROM goods_table limit 0,6 ", null);
				request.setAttribute("g_list", g_list);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}else{
				g_list = new Goods_db().getGoodsList("SELECT * FROM goods_table where type_id=?", list);
				request.setAttribute("g_list", g_list);
				request.getRequestDispatcher("prolist.jsp").forward(request, response);
			}
			
		}else if(uri.equals("search")){

			String seach_value = request.getParameter("seach_value");

			List<Goods> g_list ;
			if(seach_value==null||seach_value.equals("")){
				g_list = new Goods_db().getGoodsList("SELECT * FROM goods_table ", null);
				request.setAttribute("g_list", g_list);
				request.getRequestDispatcher("prolist.jsp").forward(request, response);
			}else{
				g_list = new Goods_db().getGoodsList("SELECT * FROM goods_table where product_name like '%"+seach_value+"%'", null);
				request.setAttribute("g_list", g_list);
				request.getRequestDispatcher("prolist.jsp").forward(request, response);
			}
			
		}else if(uri.equals("goodsinfo")){

			String id = request.getParameter("id");
			List<Object> list = new ArrayList<Object>();
			list.add(id);

			Goods goods = new Goods_db().getGoods("SELECT * FROM goods_table where id=?", list);
			request.setAttribute("goods", goods);
			
			request.getRequestDispatcher("productdescription.jsp").forward(request, response);
			
			
		}else if(uri.equals("cart")){

			List<Object> list = new ArrayList<Object>();
			User user = (User)request.getSession().getAttribute("user");
			
			list.add(user.getUsername());
			list.add(user.getPassword());
			
			user = new User_db().getUser("SELECT * FROM USER_TABLE WHERE USERNAME=? AND PASSWORD=? AND TYPE=1",list);

			list.clear();
			list.add(user.getId());

			List<Cart> cart_list = new Cart_db().getCartList("SELECT * FROM order_table where status=0 and user_id=? order by create_time desc", list);
			request.setAttribute("cart_list", cart_list);
			//获取用户的地址信息
			list.clear();
			list.add(user.getId());
			List<Address> add_list = new Address_db().getAddressList("SELECT * FROM address_table where user_id=?", list);
			request.getSession().getServletContext().setAttribute("addressList", add_list);
			request.setAttribute("address_list", add_list);
			
			request.getRequestDispatcher("shoppincart.jsp").forward(request, response);
			
		}else if(uri.equals("order")){

			List<Object> list = new ArrayList<Object>();
			list.add(((User)request.getSession().getAttribute("user")).getId());

			List<Cart> cart_list = new Cart_db().getCartList("SELECT * FROM order_table where ( status=1 or  status=2) and user_id=? order by create_time desc", list);
			request.setAttribute("cart_list", cart_list);
			request.getRequestDispatcher("dingdan.jsp").forward(request, response);
			
			
		}else if(uri.equals("addCart")){
			String type_id = request.getParameter("type_id");
			String color_id = request.getParameter("color_id");
			String size_id = request.getParameter("size_id");
			
			if(type_id.equals("1")){
				if(checkUser(request,response)==1){
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}else{
				String id = request.getParameter("id");
				List<Object> list  = new ArrayList<Object>();
				list.add(id);
				list.add(color_id);
				list.add(size_id);
				User user = (User)request.getSession().getAttribute("user");
				list.add(user.getId());
				Cart cart = new Cart_db().getCart("SELECT * FROM order_table where goods_id=? and color_id=? and size_id=? and user_id=?  and status=0", list);
				
			if(cart!=null){
				

				list = new ArrayList<Object>();
				list.add(cart.getQUATITY()+1);
				list.add(cart.getId());
				String sql = "UPDATE order_table SET QUATITY=?,create_time = now() WHERE ID=?";
				int result = new User_db().ExecuteSql(sql, list);
				if(result>0){
					list.clear();
					list.add(user.getId());
					List<Cart> cart_list = new Cart_db().getCartList("SELECT * FROM order_table where status=0 and user_id=?", list);
					request.setAttribute("cart_list", cart_list);
					request.getRequestDispatcher("shoppincart.jsp").forward(request, response);
				}else{

					response.sendRedirect("goodsinfo.QTServlet?id="+id);
				}
				
				
			}else{


				list  = new ArrayList<Object>();
				list.add(((User)request.getSession().getAttribute("user")).getId());
				list.add(id);
				list.add(color_id);
				list.add(size_id);
								
				String sql = "INSERT INTO order_table(user_id,goods_id,QUATITY,color_id,size_id,create_time,status) VALUES(?,?,1,?,?,now(),0)";
				
				int result = new User_db().ExecuteSql(sql, list);
				System.out.println(result);
				if(result>0){
					
					request.getRequestDispatcher("shoppincart.jsp").forward(request, response);
				}else{

					response.sendRedirect("goodsinfo.QTServlet?id="+id);
				}
			}
			}

				User user = (User)request.getSession().getAttribute("user");
				List<Cart> cart = new Cart_db().getCartList("SELECT * FROM order_table where status=0 and user_id = '"+user.getId()+"'",null);
				request.getSession().setAttribute("cart_num", cart.size());
				request.setAttribute("cart_list", cart);
			}
			if(type_id.equals("2")){
			if(checkUser(request,response)==1){
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}else{
			String id = request.getParameter("id");
			List<Object> list  = new ArrayList<Object>();
			list.add(((User)request.getSession().getAttribute("user")).getId());
			list.add(id);
			list.add(color_id);
			list.add(size_id);
			

			
			String sql = "INSERT INTO order_table(user_id,goods_id,QUATITY,color_id,size_id,create_time,status) VALUES(?,?,1,?,?,now(),1)";
			int result = new User_db().ExecuteSql(sql, list);
			if(result>0){
				List<Cart> cart_list = new Cart_db().getCartList("SELECT * FROM order_table where ( status=1 or  status=2) and user_id=?", list);
				request.setAttribute("cart_list", cart_list);
				request.getRequestDispatcher("dingdan.jsp").forward(request, response);
			}else{
				User user = (User)request.getSession().getAttribute("user");
				List<Cart> cart = new Cart_db().getCartList("SELECT * FROM order_table where status=0 and user_id = '"+user.getId()+"'",null);
				request.setAttribute("cart_list", cart);
				request.getRequestDispatcher("shoppincart.jsp").forward(request, response);
			}
			}
			
			}
			

			
		}else if(uri.equals("updateCart")){
			if(checkUser(request,response)==1){
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}else{
			String id = request.getParameter("id");
			List<Object> list = new ArrayList<Object>();
			list.add(id);
			String sql = "UPDATE order_table SET status=1 WHERE ID=?";
			int result = new User_db().ExecuteSql(sql, list);
			if(result>0){

				request.getRequestDispatcher("dingdan.jsp").forward(request, response);
			}else{

				request.getRequestDispatcher("shoppincart.jsp").forward(request, response);
			}
			}
		}else if(uri.equals("delCart")){
			String goodsid= request.getParameter("id");
			String sql = "DELETE FROM order_table WHERE ID="+goodsid;
			new Goods_db().ExecuteSql(sql, null);
			response.sendRedirect("cart.QTServlet");
		}else if(uri.equals("delOrder")){
			String goodsid= request.getParameter("id");
			String sql = "DELETE FROM order_table WHERE ID="+goodsid;
			new Goods_db().ExecuteSql(sql, null);
			response.sendRedirect("order.QTServlet");
		}else if(uri.equals("xgOrder")){
			String[] cart_check_value = request.getParameterValues("cart_check_value");
			String[] cart_id_ary = request.getParameterValues("cart_id");
			String[] cart_num = request.getParameterValues("cart_num");
			String caozuo_type  =  request.getParameter("caozuo_type");
			
			String addressId = request.getParameter("address_radio");
			List<Address> add_list = (List<Address>)request.getSession().getServletContext().getAttribute("addressList");
			String orderId = UUID.randomUUID().toString().replaceAll("-","").substring(16);
			
			if(caozuo_type.equals("1")&&cart_check_value!=null){

				for (int i = 0; i < cart_check_value.length; i++) {
					for (int j = 0; j < cart_id_ary.length; j++) {
						if(cart_id_ary[j].equals(cart_check_value[i])){
							String sql = "delete from  order_table where id = "+cart_id_ary[j];
							int result = new User_db().ExecuteSql(sql, null);
						}
					}
				}

				User user = (User)request.getSession().getAttribute("user");
				List<Cart> cart = new Cart_db().getCartList("SELECT * FROM order_table where status=0 and user_id = '"+user.getId()+"'",null);
				request.getSession().setAttribute("cart_num", cart.size());
				response.sendRedirect("cart.QTServlet");
			}else if(caozuo_type.equals("2")&&cart_check_value!=null){
				
				for (int i = 0; i < cart_check_value.length; i++) {
					for (int j = 0; j < cart_id_ary.length; j++) {
						if(cart_id_ary[j].equals(cart_check_value[i])){
							List<Object> list = new ArrayList<Object>();
							list.add(cart_num[j]);
							list.add(orderId);
							list.add(cart_id_ary[j]);
							String sql = "UPDATE order_table SET status=1,QUATITY=?,create_time = now(),order_id=? WHERE ID=?";
							int result = new User_db().ExecuteSql(sql, list);
						}
					}
				}
				
				if (addressId != null && addressId.length() !=0) {
					Integer index = Integer.valueOf(addressId);
					List<Object> list = new ArrayList<Object>();
					Address address = (Address) add_list.get(index);
					list.clear();
					list.add(orderId);
					list.add(address.getRecipients());
					list.add(address.getAddress());
					list.add(address.getTel());
					String sql = "INSERT INTO order_detail(order_id,recipients,address,tel) VALUES(?,?,?,?)";
					int result = new OrderDetail_db().ExecuteSql(sql, list);
				}

				User user = (User)request.getSession().getAttribute("user");
				List<Cart> cart = new Cart_db().getCartList("SELECT * FROM order_table where status=0 and user_id = '"+user.getId()+"'",null);
				request.getSession().setAttribute("cart_num", cart.size());
				response.sendRedirect("order.QTServlet");
			}else{
				response.sendRedirect("cart.QTServlet");
			}
		} else if(uri.equals("orderDetail")) {
			String orderId = request.getParameter("orderId");
			OrderDetail detail = new OrderDetail_db().getOrderDetail("select * from order_detail where order_id = '"+ orderId +"'", null);
			//转为JSON格式的数据
			String jsonString = JSON.toJSONString(detail);
			response.setContentType("text/json; charset=UTF-8");
			PrintWriter out = response.getWriter(); 
			out.println(jsonString);
			
			//{{'name':'test','pwd':'123'},{'name':'test','pwd':'123'},{'name':'test','pwd':'123'}}
		} else if (uri.equals("manageAdd")) {
			
			User user = (User)request.getSession().getAttribute("user");
			List<Object> list = new ArrayList<Object>();
			list.add(user.getUsername());
			list.add(user.getPassword());
			user = new User_db().getUser("SELECT * FROM USER_TABLE WHERE USERNAME=? AND PASSWORD=? AND TYPE=1",list);
			list.clear();
			list.add(user.getId());
			List<Address> add_list = new Address_db().getAddressList("SELECT * FROM address_table where user_id=?", list);
			
			
			String jsonString = JSON.toJSONString(add_list);
			 response.setContentType("text/json; charset=UTF-8");
			 PrintWriter out = response.getWriter(); 
			 out.println(jsonString);
			
		} else if(uri.equals("addAddress")) {
			String recipients = request.getParameter("recipients");
			String address = request.getParameter("address");
			String tel = request.getParameter("tel");
			String origin = request.getParameter("origin");
			List<Object> list = new ArrayList<Object>();
			
			User user = (User)request.getSession().getAttribute("user");
			list.add(user.getUsername());
			list.add(user.getPassword());
			
			user = new User_db().getUser("SELECT * FROM USER_TABLE WHERE USERNAME=? AND PASSWORD=? AND TYPE=1",list);
			
			list.clear();
			list.add(recipients);
			list.add(address);
			list.add(tel);
			String sql = "";
			if (origin.length() ==0 || origin == null) {
				list.add(user.getId());
				sql = "INSERT INTO address_table(recipients,address,tel,user_id) VALUES(?,?,?,?)";
			} else {
				String[] arg = origin.split(",");
				list.add(arg[0]);
				list.add(arg[1]);
				list.add(arg[2]);
				sql = "update address_table set recipients=?,address=?,tel=? where recipients = ? and address = ? and tel =?";
			}
			new Address_db().ExecuteSql(sql, list);
			
			request.getRequestDispatcher("changepwd.jsp").forward(request,response);
		} else if(uri.equals("deleteAddress")) {
				String recipients = request.getParameter("recipients");
				String address = request.getParameter("address");
				String tel = request.getParameter("tel");
				List<Object> list = new ArrayList<Object>();
				
				User user = (User)request.getSession().getAttribute("user");
				list.add(user.getUsername());
				list.add(user.getPassword());
				
				user = new User_db().getUser("SELECT * FROM USER_TABLE WHERE USERNAME=? AND PASSWORD=? AND TYPE=1",list);
				
				list.clear();
				list.add(recipients);
				list.add(address);
				list.add(tel);
				list.add(user.getId());
				String sql = "DELETE FROM address_table WHERE recipients=? AND address=? AND tel=? AND user_id=?";
				new Address_db().ExecuteSql(sql, list);
				
				String jsonString = JSON.toJSONString("success");
				response.setContentType("text/json; charset=UTF-8");
				PrintWriter out = response.getWriter(); 
				out.println(jsonString);
		}
	}
	
	public int checkUser(HttpServletRequest request, HttpServletResponse response){
		int res= 0;
		if(request.getSession().getAttribute("user")==""||request.getSession().getAttribute("user")==null){
				res=1;
		}
		return res;
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		
	}

}

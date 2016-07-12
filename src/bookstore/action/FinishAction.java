package bookstore.action;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.opensymphony.xwork2.ActionSupport;

public class FinishAction extends ActionSupport{
	
	private String orderId;
	public void setOrderId(String orderId){
		this.orderId=orderId;
	}
	public String getOrderId(){
		return orderId;
	}
	
	public String execute() throws Exception{
		Date d=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//HH:24小时制
		String fd=format.format(d);
		String url="jdbc:mysql://localhost:3306/bookstore_struts2";
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=(Connection)DriverManager.getConnection(url,"root","123456");
			Statement stmt=(Statement)conn.createStatement();
			stmt.execute("update orders set finish_date='"+fd+"' where id='"+orderId+"';");
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
		System.out.println(orderId);
		return SUCCESS;
	}

}

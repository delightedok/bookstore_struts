package bookstore.action;

import java.util.HashMap;
import java.util.Map;
import java.sql.*;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport{

	private String username;
	private String password;
	private String returnUri;
	
	public void setUsername(String username){
		this.username=username;
	}
	public void setPassword(String password){
		this.password=password;
	}
	public void setReturnUrl(String returnUri){
		this.returnUri=returnUri;
	}
	public String getUsername(){
		return username;
	}
	public String getPassword(){
		return password;
	}
	public String getReturnUri(){
		return returnUri;
	}
	
	public String execute() throws Exception{
		
		//数据库操作
		String syntax="select * from users where username=\""+getUsername()+"\" and password=\""+getPassword()+"\"";
		
		ResultSet rs=null;
		String url="jdbc:mysql://localhost:3306/bookstore_struts2";
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=(Connection)DriverManager.getConnection(url,"root","123456");
			Statement stmt=(Statement)conn.createStatement();
			rs=stmt.executeQuery(syntax);
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
		System.out.println("1");
		
		if(rs.next()){
			ActionContext.getContext().getSession().put("login", "true");
			ActionContext.getContext().getSession().put("username", getUsername());
			ActionContext.getContext().getSession().put("userId", (int)rs.getObject("id"));/*
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn=(Connection)DriverManager.getConnection(url,"root","123456");
				Statement stmt=(Statement)conn.createStatement();
				stmt.execute("update users set active='t' where username='"+getUsername()+"'");
			}catch(ClassNotFoundException e){
				e.printStackTrace();
			}catch(SQLException e){
				e.printStackTrace();
			}*/
		}
		
		returnUri=(String)ActionContext.getContext().getSession().get("uri");
		
		
		return SUCCESS;
	}
	
}

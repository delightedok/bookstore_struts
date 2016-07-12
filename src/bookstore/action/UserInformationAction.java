package bookstore.action;

import java.sql.*;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import bookstore.object.User;

public class UserInformationAction extends ActionSupport{
	
	private String username;
	private User user;
	public String getUsername(){
		return username;
	}
	public User getUser(){
		return user;
	}
	public void setUsername(String username){
		this.username=username;
	}
	public void setUser(User user){
		this.user=user;
	}
	
	public String execute() throws Exception{
		ActionContext cxt=ActionContext.getContext();
		username=(String)cxt.getSession().get("username");
		System.out.println(username);//
		String url="jdbc:mysql://localhost:3306/bookstore_struts2";
		ResultSet rs=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=(Connection)DriverManager.getConnection(url,"root","123456");
			Statement stmt=(Statement)conn.createStatement();
			rs=stmt.executeQuery("select * from users where username=\""+username+"\"");
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
		if(rs!=null&&rs.next()){
			user=new User();
			user.setEmail(rs.getString("email"));
			user.setTelephone(rs.getString("telephone"));
			user.setId(rs.getInt("id"));
		}
		return SUCCESS;
	}

}

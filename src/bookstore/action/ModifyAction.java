package bookstore.action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import bookstore.object.User;

public class ModifyAction extends ActionSupport{

	private User user;
	public User getUser(){
		return user;
	}
	public void setUser(User user){
		this.user=user;
	}
	
	public String execute() throws Exception{
		System.out.println(user.getId());
		System.out.println(user.getUsername());
		System.out.println(user.getEmail());
		System.out.println(user.getTelephone());
		String syntax="update users set username=\""+user.getUsername()+"\",email=\""+user.getEmail()+"\",telephone=\""+user.getTelephone()+"\" where id=\""+user.getId()+"\";";
		String url="jdbc:mysql://localhost:3306/bookstore_struts2";
		System.out.println(syntax);
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=(Connection)DriverManager.getConnection(url,"root","123456");
			Statement stmt=(Statement)conn.createStatement();
			stmt.execute(syntax);
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
		ActionContext cxt=ActionContext.getContext();
		cxt.getSession().put("username", user.getUsername());
		return SUCCESS;
	}
	
}

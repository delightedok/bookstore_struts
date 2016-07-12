package bookstore.action;

import java.sql.*;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LogOutAction extends ActionSupport{
	
	public String execute() throws Exception{
		ActionContext cxt=ActionContext.getContext();
		String username=(String)cxt.getSession().get("username");
		String url="jdbc:mysql://localhost:3306/bookstore_struts2";
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=(Connection)DriverManager.getConnection(url,"root","123456");
			Statement stmt=(Statement)conn.createStatement();
			stmt.execute("update users set active='f' where username='"+username+"';");
			cxt.getSession().remove("username");
			cxt.getSession().remove("userId");
			cxt.getSession().put("login", "false");
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return SUCCESS;
	}

}

package bookstore.manager.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;

public class LoginAction extends ActionSupport{
	
	private String managername;
	private String managerpassword;
	
	public void setManagername(String managername){
		this.managername=managername;
	}
	public void setManagerpassword(String managerpassword){
		this.managerpassword=managerpassword;
	}
	public String getManagername(){
		return managername;
	}
	public String getManagerpassword(){
		return managerpassword;
	}
	
	public String execute() throws Exception{
		String url="jdbc:mysql://localhost:3306/bookstore_struts2";
		String syntax="select * from managers where name='"+managername+"' and password='"+managerpassword+"';";
		ResultSet rs=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=(Connection)DriverManager.getConnection(url,"root","123456");
			Statement stmt=(Statement)conn.createStatement();
			rs=stmt.executeQuery(syntax);
			if(rs.next()){
				ActionContext.getContext().getSession().put("manager_login", "true");
				ActionContext.getContext().getSession().put("managerid", rs.getInt("id"));
				ActionContext.getContext().getSession().put("permission", rs.getString("permission"));
				ActionContext.getContext().getSession().put("login_to_show", "true");
				return SUCCESS;
			}
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
		ActionContext.getContext().getSession().put("manager_login", "incorrect");
		return ERROR;
	}

}

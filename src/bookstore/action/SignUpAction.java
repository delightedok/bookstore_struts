package bookstore.action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SignUpAction extends ActionSupport{
	
	private String username;
	private String password;
	private String email;
	private String returnUri;
	
	public void setUsername(String username){
		this.username=username;
	}
	public void setPassword(String password){
		this.password=password;
	}
	public void setEmail(String email){
		this.email=email;
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
	public String getEmail(){
		return email;
	}
	public String getReturnUri(){
		return returnUri;
	}
	
	public String execute() throws Exception{
		
		//数据库操作
		String syntax="insert into users (username,email,password) values ('"+getUsername()+"','"+getEmail()+"','"+getPassword()+"');";
		boolean result=false;
		String url="jdbc:mysql://localhost:3306/bookstore_struts2";
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=(Connection)DriverManager.getConnection(url,"root","123456");
			Statement stmt=(Statement)conn.createStatement();
			ResultSet rst=stmt.executeQuery("select * from users where username='"+getUsername()+"';");
			System.out.println(11);
			if(rst.next()){
				if(ActionContext.getContext().getSession().get("error")=="true"){
					return "error";
				}
				ActionContext.getContext().getSession().put("error", "true");
				String uri=(String)ActionContext.getContext().getSession().get("uri");
				ActionContext.getContext().getSession().put("muri", uri);
				return "error";
			}
			System.out.println(12);
			result=stmt.execute(syntax);
			ActionContext.getContext().getSession().put("login", "true");
			ActionContext.getContext().getSession().put("username", getUsername());
			ResultSet rs=stmt.executeQuery("select id from users where username='"+getUsername()+"' and password='"+getPassword()+"';");
			ActionContext.getContext().getSession().put("userId", (int)rs.getObject("id"));
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
		if(ActionContext.getContext().getSession().get("error")=="true"){
			returnUri=(String)ActionContext.getContext().getSession().get("muri");
			ActionContext.getContext().getSession().put("error", "false");
		}else{returnUri=(String)ActionContext.getContext().getSession().get("uri");}
		System.out.println(returnUri);
		System.out.println("result:"+result);
		
		
		return SUCCESS;
	}

}

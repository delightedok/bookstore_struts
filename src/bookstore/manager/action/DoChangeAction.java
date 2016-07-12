package bookstore.manager.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;

import javax.servlet.http.Cookie;

import org.apache.struts2.ServletActionContext;

public class DoChangeAction extends ActionSupport{

	private String choose;
	public void setChoose(String choose){
		this.choose=choose;
	}
	public String getChoose(){
		return choose;
	}
	
	public String execute() throws Exception{
		String url="jdbc:mysql://localhost:3306/bookstore_struts2";
		String book_updateSyntax="update books set name = ?, owner = ?, author = ?, amount = ?, price = ?, publisher = ?, publish_date = ?, ISBN = ?, description = ? where name = ? and owner = ? and author = ? ;";
		String book_deleteSyntax="delete from books where name= ? and owner= ? and author= ? ;";
		String user_updateSyntax="update users set username = ?, email = ?, telephone = ?, seller = ?, permission = ? where id= ? ;";
		String order_updateSyntax="update orders set bookname = ?, seller = ?, amount = ?, create_date = ?, finish_date = ?, buyerId= ?, address = ?, telephone = ?, email = ? where id = ? ;";
		String user_deleteSyntax="delete from users where id= ? ;";
		String order_deleteSyntax="delete from orders where id= ? ;";
		String simpleSyntax="select id from users where username= ? ;";
		PreparedStatement bustmt=null;
		PreparedStatement bdstmt=null;
		PreparedStatement oustmt=null;
		PreparedStatement uustmt=null;
		PreparedStatement udstmt=null;
		PreparedStatement odstmt=null;
		PreparedStatement stmt=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=(Connection)DriverManager.getConnection(url,"root","123456");
				bustmt=(PreparedStatement)conn.prepareStatement(book_updateSyntax);
				bdstmt=(PreparedStatement)conn.prepareStatement(book_deleteSyntax);
				oustmt=(PreparedStatement)conn.prepareStatement(order_updateSyntax);
				uustmt=(PreparedStatement)conn.prepareStatement(user_updateSyntax);
				udstmt=(PreparedStatement)conn.prepareStatement(user_deleteSyntax);
				odstmt=(PreparedStatement)conn.prepareStatement(order_deleteSyntax);
				stmt=(PreparedStatement)conn.prepareStatement(simpleSyntax);
			
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
		try{
			if(bustmt!=null && bdstmt!=null && oustmt!=null && uustmt!=null && udstmt!=null && odstmt!=null && stmt!=null){
				Cookie[] cookies=ServletActionContext.getRequest().getCookies();
				for(Cookie cookie:cookies){
					if(cookie.getName().indexOf("saveb")==0){//编辑books
						String value=cookie.getValue();
						String []values=value.split("#");
						bustmt.setString(1, values[0]);
						stmt.setString(1, values[1]);
						ResultSet rs=stmt.executeQuery();
						if(rs.next()){
							bustmt.setInt(2, rs.getInt(1));
							bustmt.setInt(11, rs.getInt(1));
						}else{
							return ERROR;
						}
						bustmt.setString(3, values[2]);
						bustmt.setInt(4, Integer.parseInt(values[3]));
						bustmt.setString(5, values[4]);
						bustmt.setString(6, values[5]);
						bustmt.setString(7, values[6]);
						bustmt.setString(8, values[7]);
						bustmt.setString(9, values[8]);
						bustmt.setString(10, values[0]);
						bustmt.setString(12, values[2]);
						bustmt.executeUpdate();
						cookie.setMaxAge(0);
						ServletActionContext.getResponse().addCookie(cookie);
					}else if(cookie.getName().indexOf("saveo")==0){//编辑orders
						String value=cookie.getValue();
						System.out.println(value);
						String []values=value.split("\\*");
						String []et=values[9].split("\\$");
						String []et0=et[0].split("&");
						et[0]=et0[0]+"@"+et0[1];
						values[9]=et[0]+"."+et[1];
						System.out.println(values[9]);
						oustmt.setString(1, values[0]);
						oustmt.setString(2, values[1]);
						oustmt.setString(3, values[2]);
						String []cdt=values[4].split("\\$");
						String []cdtt=cdt[1].split("\\#");
						cdt[1]=cdtt[0]+":"+cdtt[1]+":"+cdtt[2];
						values[4]=cdt[0]+" "+cdt[1];
						String []fdt=values[5].split("\\$");
						String []fdtt=fdt[1].split("\\#");
						fdt[1]=fdtt[0]+":"+fdtt[1]+":"+fdtt[2];
						values[5]=fdt[0]+" "+fdt[1];
						oustmt.setString(4, values[4]);
						oustmt.setString(5, values[5]);
						stmt.setString(1, values[6]);
						ResultSet rs=stmt.executeQuery();
						if(rs.next()){
							oustmt.setInt(6, rs.getInt(1));
						}else{
							return ERROR;
						}
						oustmt.setString(7, values[7]);
						oustmt.setString(8, values[8]);
						oustmt.setString(9, values[9]);
						oustmt.setInt(10, Integer.parseInt(values[3]));
						oustmt.executeUpdate();
						cookie.setMaxAge(0);
						ServletActionContext.getResponse().addCookie(cookie);
					}else if(cookie.getName().indexOf("save")==0){//编辑users
						String value=cookie.getValue();
						System.out.println(value);
						String []values=value.split("\\#");
						System.out.println(values[1]);
						String []et=values[1].split("\\$");
						System.out.println(et[0]);
						String []et0=et[0].split("&");
						System.out.println(et0[0]);
						et[0]=et0[0]+"@"+et0[1];
						values[1]=et[0]+"."+et[1];
						System.out.println(values[1]);
						uustmt.setString(1, values[0]);
						uustmt.setString(2, values[1]);
						uustmt.setString(3, values[2]);
						uustmt.setString(4, values[5]);
						uustmt.setString(5, values[4]);
						uustmt.setInt(6, Integer.parseInt(values[3]));
						uustmt.executeUpdate();
						cookie.setMaxAge(0);
						ServletActionContext.getResponse().addCookie(cookie);
					}else if(cookie.getName().indexOf("deleteb")==0){//删除书本
						String value=cookie.getValue();
						System.out.println(value);
						String []values=value.split("#");
						stmt.setString(1, values[1]);
						ResultSet rs=stmt.executeQuery();
						if(rs.next()){
							bdstmt.setString(1, values[0]);
							bdstmt.setInt(2, rs.getInt(1));
							bdstmt.setString(3, values[2]);
							bdstmt.executeUpdate();
						}else{
							return ERROR;
						}
						cookie.setMaxAge(0);
						ServletActionContext.getResponse().addCookie(cookie);
					}else if(cookie.getName().indexOf("deleteo")==0){//删除订单
						String value=cookie.getValue();
						odstmt.setInt(1, Integer.parseInt(value));
						odstmt.executeUpdate();
						cookie.setMaxAge(0);
						ServletActionContext.getResponse().addCookie(cookie);
					}else if(cookie.getName().indexOf("delete")==0){//删除用户
						String value=cookie.getValue();
						udstmt.setInt(1, Integer.parseInt(value));
						udstmt.executeUpdate();
						cookie.setMaxAge(0);
						ServletActionContext.getResponse().addCookie(cookie);
					}
				}
			}else{
				return ERROR;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		ActionContext.getContext().getSession().put("hasChoose", "true");
		ActionContext.getContext().getSession().put("choice", choose);
		
		
		return SUCCESS;
	}
	
}

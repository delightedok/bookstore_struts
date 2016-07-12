package bookstore.manager.action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import bookstore.object.Book;
import bookstore.object.Order;
import bookstore.object.User;

public class ShowInfoAction extends ActionSupport{

	private String choose;
	public String getChoose(){
		return choose;
	}
	public void setChoose(String choose){
		this.choose=choose;
	}
	
	private List<Object> result;
	public void setResult(List<Object> result){
		this.result=result;
	}
	public List<Object> getResult(){
		return result;
	}
	
	public String execute() throws Exception{
		
		if(ActionContext.getContext().getSession().get("login_to_show")=="true"){
			//chooseList=new ArrayList<Map<String,String>>();
			/*
			Map<String,String> m=new HashMap();
			m.put("users", "用户信息");
			//chooseList.add(m);
			m.put("books", "图书信息");
			//chooseList.add(m);
			m.put("orders", "订单信息");
			//chooseList.add(m);*/
			choose="users";
			ActionContext.getContext().getSession().put("login_to_show", "false");
			//return SUCCESS;
		}/*
		chooseList=new ArrayList<String>();
		chooseList.add("用户信息");
		chooseList.add("图书信息");
		chooseList.add("订单信息");*/
		
		if(ActionContext.getContext().getSession().get("hasChoose")=="true"){
			choose=(String)ActionContext.getContext().getSession().get("choice");
			ActionContext.getContext().getSession().put("hasChoose", "false");
			ActionContext.getContext().getSession().remove("choice");
		}
		
		ResultSet rs=null;
		String url="jdbc:mysql://localhost:3306/bookstore_struts2";
		String syntax="select * from "+choose+";";
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
		if(rs!=null){
			result=new ArrayList<Object>();
			if(choose.equals("users")){
				while(rs.next()){
					User u=new User();
					u.setUsername(rs.getString(1));
					u.setEmail(rs.getString(3));
					u.setId(rs.getInt(6));
					u.setTelephone(rs.getString(4));
					u.setPermission(rs.getString(7));
					u.setSeller(rs.getString(5));
					result.add(u);
				}
			}else if(choose.equals("books")){
				while(rs.next()){
					Book b=new Book();
					b.setName(rs.getString(1));
					ResultSet rst=null;
					int oi=rs.getInt(2);
					try{
						Class.forName("com.mysql.jdbc.Driver");
						Connection conn=(Connection)DriverManager.getConnection(url,"root","123456");
						Statement stmt=(Statement)conn.createStatement();
						rst=stmt.executeQuery("select username from users where id='"+oi+"';");
					}catch(ClassNotFoundException e){
						e.printStackTrace();
					}catch(SQLException e){
						e.printStackTrace();
					}
					if(rst!=null){
						if(rst.next()){
							b.setOwner(rst.getString(1));
						}else{
							return ERROR;
						}
					}else{
						return ERROR;
					}
					b.setAuthor(rs.getString(3));
					Integer ai=rs.getInt(4);
					b.setAmount(ai.toString());
					b.setPrice(rs.getString(5));
					b.setPublisher(rs.getString(7));
					b.setPublish_date(rs.getString(8));
					b.setISBN(rs.getString(9));
					b.setDescription(rs.getString(10));
					result.add(b);
				}
			}else if(choose.equals("orders")){
				while(rs.next()){
					Order o=new Order();
					o.setBookname(rs.getString(1));
					o.setSeller(rs.getString(2));
					o.setAmount(rs.getString(3));
					o.setId(rs.getInt(4));
					o.setCreate_date(rs.getString(5));
					o.setFinish_date(rs.getString(6));
					int bi=rs.getInt(7);
					ResultSet rst=null;
					try{
						Class.forName("com.mysql.jdbc.Driver");
						Connection conn=(Connection)DriverManager.getConnection(url,"root","123456");
						Statement stmt=(Statement)conn.createStatement();
						rst=stmt.executeQuery("select username from users where id='"+bi+"';");
					}catch(ClassNotFoundException e){
						e.printStackTrace();
					}catch(SQLException e){
						e.printStackTrace();
					}
					if(rst!=null){
						if(rst.next()){
							o.setBuyer(rst.getString(1));
						}else{
							return ERROR;
						}
					}else{
						return ERROR;
					}
					o.setAddress(rs.getString(8));
					o.setTelephone(rs.getString(9));
					o.setEmail(rs.getString(10));
					result.add(o);
				}
			}else{
				return ERROR;
			}
		}
		
		
		return SUCCESS;
	}
	
}

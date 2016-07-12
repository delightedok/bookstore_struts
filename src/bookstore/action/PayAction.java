package bookstore.action;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;

import javax.servlet.http.Cookie;

import org.apache.struts2.ServletActionContext;

import java.util.Date;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import bookstore.object.Book;

public class PayAction extends ActionSupport{

	private List<Book> order;
	private String address;
	private String telephone;
	private String email;
	private String orderId;
	
	public void setOrder(List<Book> order){
		this.order=order;
	}
	public void setAddress(String address){
		this.address=address;
	}
	public void setTelephone(String telephone){
		this.telephone=telephone;
	}
	public void setEmail(String email){
		this.email=email;
	}
	public void setOrderId(String orderId){
		this.orderId=orderId;
	}
	public List<Book> getOrder(){
		return order;
	}
	public String getAddress(){
		return address;
	}
	public String getTelephone(){
		return telephone;
	}
	public String getEmail(){
		return email;
	}
	public String getOrderId(){
		return orderId;
	}
	
	public String execute() throws Exception{
		
		//检查是否已经登陆
		if(!(ActionContext.getContext().getSession().get("login")=="true")){
			return "loginInFirst";
		}
		
		order=new ArrayList<Book>();
		Cookie []cookies=ServletActionContext.getRequest().getCookies();
		int j=0;
		for(int i=0;i<cookies.length;i++){
			Cookie cookie=cookies[i];
			if(cookie.getName().indexOf("bookname")==0){
				String bookcount=cookie.getValue();
				String temp=cookie.getName();
				temp=temp.substring(9);
				String []temp2=temp.split("\\$");
				String t1[]=temp2[0].split("\\#");
				String t11="";
				for(int m=1;m<t1.length;m++){
					t11=t11+t1[m]+" ";
				}
				String t2[]=temp2[1].split("\\#");
				String t22="";
				for(int n=1;n<t2.length;n++){
					t22=t22+t2[n]+" ";
				}
				Book b=new Book();
				b.setName(t11.trim());
				b.setOwner(t22.trim());
				b.setAmount(bookcount);
				
				//修改数据库图书数量
				try{
					Class.forName("com.mysql.jdbc.Driver");
					Connection conn=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore_struts2","root","123456");
					Statement stmt=(Statement)conn.createStatement();
					ResultSet rs1=stmt.executeQuery("select id from users where username='"+b.getOwner()+"';");
					int owneri=0;
					if(rs1.next()){owneri=rs1.getInt("id");}
					else{return ERROR;}
					ResultSet rs=stmt.executeQuery("select amount from books where name='"+b.getName()+"' and owner='"+owneri+"';");
					if(rs.next()){
						int amounti=rs.getInt("amount");
						if(Integer.parseInt(b.getAmount())>amounti){
							return ERROR;
						}
						else{
							int amountt=amounti-Integer.parseInt(b.getAmount());
							stmt.execute("update books set amount='"+amountt+"' where name='"+b.getName()+"' and owner='"+owneri+"';");
						}
					}else{
						return ERROR;
					}
				}catch(ClassNotFoundException e){
					e.printStackTrace();
				}catch(SQLException e){
					e.printStackTrace();
				}
				
				order.add(j,b);
				j++;
			}
		}
		
		String bname="",sell="",amt="";
		System.out.println("size:"+order.size());
		for(int i=0;i<order.size();i++){
			bname=bname+order.get(i).getName()+"#";
			sell=sell+order.get(i).getOwner()+"#";
			amt=amt+order.get(i).getAmount()+"#";
		}
		if(order.size()>0){
			bname=bname.substring(0,bname.length()-1);
			sell=sell.substring(0,sell.length()-1);
			amt=amt.substring(0,amt.length()-1);
		}
		
		String cd="";
		Date d=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//HH:24小时制
		cd=format.format(d);
		Integer userIdi=(Integer)ActionContext.getContext().getSession().get("userId");
		String userId=userIdi.toString();
		String url="jdbc:mysql://localhost:3306/bookstore_struts2";
		String syntax="insert into orders (bookname,seller,amount,create_date,buyerId,address,telephone,email) values ('"
				+bname+"','"+sell+"','"+amt+"','"+cd+"',"+userId+",'"+address+"','"+telephone+"','"+email+"');";
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=(Connection)DriverManager.getConnection(url,"root","123456");
			Statement stmt=(Statement)conn.createStatement();
			stmt.execute(syntax);
			ResultSet rs=stmt.executeQuery("select id from orders where buyerId='"+userId+"' and create_date='"+cd+"';");
			while(rs.next()){
				orderId=rs.getString("id");
			}
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
		System.out.println(syntax);
		System.out.println(orderId);
		
		//删除cookies
		Cookie []dcookies=ServletActionContext.getRequest().getCookies();
		for(int i=0;i<dcookies.length;i++){
			Cookie cookie=dcookies[i];
			if(cookie.getName().indexOf("JSESSIONID")==0){
				continue;
			}
			Cookie newCookie=new Cookie(cookie.getName(),null);
			newCookie.setMaxAge(0);
			ServletActionContext.getResponse().addCookie(newCookie);
		}
		
		return SUCCESS;
	}
	
}

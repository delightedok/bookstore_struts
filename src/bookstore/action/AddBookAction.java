package bookstore.action;

import java.sql.*;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AddBookAction extends ActionSupport{
	
	private String name;
	private String author;
	private String price;
	private String publisher;
	private String publish_date;
	private String ISBN;
	private String amount;
	private String path;
	private String description;
	
	public void setName(String name){this.name=name;}
	public void setAuthor(String author){this.author=author;}
	public void setPrice(String price){this.price=price;}
	public void setPublisher(String publisher){this.publisher=publisher;}
	public void setPublish_date(String publish_date){this.publish_date=publish_date;}
	public void setISBN(String ISBN){this.ISBN=ISBN;}
	public void setAmount(String amount){this.amount=amount;}
	public void setPath(String path){this.path=path;}
	public void setDescription(String description){this.description=description;}
	
	public String getName(){return name;}
	public String getAuthor(){return author;}
	public String getPrice(){return price;}
	public String getPublisher(){return publisher;}
	public String getPublish_date(){return publish_date;}
	public String getISBN(){return ISBN;}
	public String getAmount(){return amount;}
	public String getPath(){return path;}
	public String getDescription(){return description;}
	
	public String execute() throws Exception{
		
		System.out.println(name);
		System.out.println(author);
		System.out.println(price);
		System.out.println(publisher);
		System.out.println(publish_date);
		System.out.println(ISBN);
		System.out.println(amount);
		if(path!=null){
			System.out.println(path);
			path="http://localhost:8888"+path;
		}
		else{path="";}
		System.out.println(description);
		String userId=ActionContext.getContext().getSession().get("userId").toString();
		String url="jdbc:mysql://localhost:3306/bookstore_struts2";
		String syntax="insert into books (name,owner,author,price,publisher,publish_date,ISBN,amount,path,description) values ('"
						+name+"','"+userId+"','"+author+"','"+price+"','"+publisher+"','"+publish_date+"','"+ISBN+"','"
						+amount+"','"+path+"','"+description+"');";
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=(Connection)DriverManager.getConnection(url,"root","123456");
			Statement stmt=(Statement)conn.createStatement();
			stmt.execute(syntax);
			ActionContext.getContext().getSession().remove("pic_uri");
			ActionContext.getContext().getSession().put("hasUpload", "false");
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		return SUCCESS;
	}

}

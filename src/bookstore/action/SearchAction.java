package bookstore.action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.components.Set;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import bookstore.object.Book;

public class SearchAction extends ActionSupport{

	private String keys;
	private List<Book> books;
	public String getKeys(){
		return keys;
	}
	public void setKeys(String keys){
		this.keys=keys;
	}
	public List<Book> getBooks(){
		return books;
	}
	public void setBooks(List<Book> books){
		this.books=books;
	}
	
	public String execute() throws Exception{
		
		int resultCounts=0;
		ResultSet rs=null;
		String syntax="";
		String url="jdbc:mysql://localhost:3306/bookstore_struts2";
		if(keys!=null){
			//syntax="select * from books where name=\""+keys+"\"";
			syntax="select books.path,books.name,books.price,users.username from books,users where users.id=books.owner and books.name=\""+keys+"\"";
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
		}
		System.out.println(syntax);
		if(rs!=null){
			resultCounts=0;
			books=new ArrayList<Book>();
			while(rs.next()){
				Book book=new Book();
				book.setName(rs.getString("name"));
				book.setPath(rs.getString("path"));
				book.setPrice(rs.getString("price"));
				book.setOwner(rs.getString("username"));
				books.add(resultCounts, book);
				System.out.println(rs.getString("name")+rs.getString("path")+rs.getString("price")+rs.getString("username"));//
				resultCounts++;
			}
			
			ActionContext ctx=ActionContext.getContext();
			ctx.getSession().put("resultCounts", resultCounts);
			
			System.out.println(keys);//
			keys=null;
		}else{
			return ERROR;
		}
		return SUCCESS;
	}
	
}

package bookstore.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import bookstore.object.Book;

public class BuyAction extends ActionSupport{
	
	private List<Book> order;
	private String totals;
	
	public void setOrder(List<Book> order){
		this.order=order;
	}
	public List<Book> getOrder(){
		return order;
	}
	public void setTotals(String totals){
		this.totals=totals;
	}
	public String getTotals(){
		return totals;
	}
	
	public String execute() throws Exception{
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
				order.add(j,b);
				j++;
			}else if(cookie.getName().indexOf("total")==0){
				totals=cookie.getValue();
			}
		}
		
		return SUCCESS;
	}
	
}

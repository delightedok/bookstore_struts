package bookstore.object;

public class Order {
	
	private String bookname;
	private String seller;
	private String amount;
	private int id;
	private String create_date;
	private String finish_date;
	private String buyer;
	private String address;
	private String telephone;
	private String email;
	
	public void setBookname(String bookname){
		this.bookname=bookname;
	}
	public void setSeller(String seller){
		this.seller=seller;
	}
	public void setAmount(String amount){
		this.amount=amount;
	}
	public void setId(int id){
		this.id=id;
	}
	public void setCreate_date(String create_date){
		this.create_date=create_date;
	}
	public void setFinish_date(String finish_date){
		this.finish_date=finish_date;
	}
	public void setBuyer(String buyer){
		this.buyer=buyer;
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
	
	public String getBookname(){
		return bookname;
	}
	public String getSeller(){
		return seller;
	}
	public String getAmount(){
		return amount;
	}
	public int getId(){
		return id;
	}
	public String getCreate_date(){
		return create_date;
	}
	public String getFinish_date(){
		return finish_date;
	}
	public String getBuyer(){
		return buyer;
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

}

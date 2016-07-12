package bookstore.object;

public class User {

	private String email;
	private String telephone;
	private int id;
	private String username;
	private String permission;
	private String seller;
	
	public String getEmail(){
		return email;
	}
	public String getTelephone(){
		return telephone;
	}
	public int getId(){
		return id;
	}
	public String getUsername(){
		return username;
	}
	public String getPermission(){
		return permission;
	}
	public String getSeller(){
		return seller;
	}
	public void setEmail(String email){
		this.email=email;
	}
	public void setTelephone(String telephone){
		this.telephone=telephone;
	}
	public void setId(int id){
		this.id=id;
	}
	public void setUsername(String username){
		this.username=username;
	}
	public void setPermission(String permission){
		this.permission=permission;
	}
	public void setSeller(String seller){
		this.seller=seller;
	}
}

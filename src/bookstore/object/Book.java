package bookstore.object;

public class Book {
	
	private String name;
	private String path;
	private String price;
	private String owner;
	private String author;
	private String amount;
	private String publisher;
	private String publish_date;
	private String ISBN;
	private String description;
	
	public void setName(String name){
		this.name=name;
	}
	public void setPath(String path){
		this.path=path;
	}
	public void setPrice(String price){
		this.price=price;
	}
	public void setOwner(String owner){
		this.owner=owner;
	}
	public void setAuthor(String author){
		this.author=author;
	}
	public void setAmount(String amount){
		this.amount=amount;
	}
	public void setPublisher(String publisher){
		this.publisher=publisher;
	}
	public void setPublish_date(String publish_date){
		this.publish_date=publish_date;
	}
	public void setISBN(String ISBN){
		this.ISBN=ISBN;
	}
	public void setDescription(String description){
		this.description=description;
	}
	
	public String getName(){
		return name;
	}
	public String getPath(){
		return path;
	}
	public String getPrice(){
		return price;
	}
	public String getOwner(){
		return owner;
	}
	public String getAuthor(){
		return author;
	}
	public String getAmount(){
		return amount;
	}
	public String getPublisher(){
		return publisher;
	}
	public String getPublish_date(){
		return publish_date;
	}
	public String getISBN(){
		return ISBN;
	}
	public String getDescription(){
		return description;
	}

}

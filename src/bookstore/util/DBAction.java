package bookstore.util;

import com.opensymphony.xwork2.ActionSupport;

import bookstore.object.Book;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DBAction extends ActionSupport{
	
	private String syntax;
	private Map<String,String> param;
	private List<Map<String,String>> result;
	
	private final String driver="com.mysql.jdbc.Driver";
	private final String url="jdbc:mysql://localhost:3306/bookstore_struts2";
	
	public String getSyntax(){
		return syntax;
	}
	public Map<String,String> getParam(){
		return param;
	}
	public List<Map<String,String>> getResult(){
		return result;
	}
	public void setSyntax(String syntax){
		this.syntax=syntax;
	}
	public void setParam(Map<String,String> param){
		this.param=param;
	}
	public void setResult(List<Map<String,String>> result){
		this.result=result;
	}
	
	public String query() throws Exception{
		ResultSet rs=null;
		result=new ArrayList<Map<String,String>>();
		for(String key:param.keySet()){
			syntax=syntax+key+"='"+(String)param.get(key)+"' and ";
		}
		syntax=syntax.substring(0,syntax.length()-5);
		syntax+=";";
		try{
			Class.forName(driver);
			Connection conn=(Connection)DriverManager.getConnection(url,"root","123456");
			Statement stmt=(Statement)conn.createStatement();
			rs=stmt.executeQuery(syntax);
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
		if(rs!=null){
			ResultSetMetaData rsmd=rs.getMetaData();
			while(rs.next()){
				Map<String,String> m=new HashMap<String,String>();
				for(int i=1;i<=rsmd.getColumnCount();i++){
					String temp=rs.getString(rsmd.getColumnLabel(i));
					if(temp==null){temp="";}
					m.put(rsmd.getColumnLabel(i), temp);
				}
				result.add(m);
			}
			return SUCCESS;
		}
		return ERROR;
	}
	/*
	public String query_order() throws Exception{
		ResultSet rs=null;
		result=new ArrayList<Map<String,String>>();
		for(String key:param.keySet()){
			syntax=syntax+key+"='"+param.get(key)+"' and ";
		}
		syntax=syntax.substring(0,syntax.length()-5);
		System.out.println(syntax);
		syntax+=";";
		try{
			Class.forName(driver);
			Connection conn=(Connection)DriverManager.getConnection(url,"root","123456");
			Statement stmt=(Statement)conn.createStatement();
			rs=stmt.executeQuery(syntax);
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
		if(rs!=null){
			ResultSetMetaData rsmd=rs.getMetaData();
			while(rs.next()){
				Map<String,String>
			}
		}
		return SUCCESS;
	}
	*/
	public String execute() throws Exception{
		return SUCCESS;
	}

}

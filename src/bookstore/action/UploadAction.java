package bookstore.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UploadAction extends ActionSupport{

	private File upload;
	private String uploadContentType;
	
	public void setUpload(File upload){
		System.out.println("set file");
		this.upload=upload;
	}
	public File getUpload(){
		return upload;
	}
	public void setUploadContentType(String uploadContentType){
		this.uploadContentType=uploadContentType;
	}
	public String getUploadContentType(){
		return uploadContentType;
	}
	
	public String execute() throws Exception{
		System.out.println("up load");
		Date d=new Date();
		DateFormat format=new SimpleDateFormat("yyyyMMddHHmmss");//HH:24小时制
		String time=format.format(d);
		ActionContext cxt=ActionContext.getContext();
		String savePath="\\data\\bookpic\\"+cxt.getSession().get("username");
		savePath=ServletActionContext.getServletContext().getRealPath(savePath);
		File filedir=new File(savePath);
		if(!filedir.exists()){
			filedir.mkdirs();
		}
		FileOutputStream fos=new FileOutputStream(savePath+"\\"+time+".png");
		FileInputStream fis=new FileInputStream(upload);
		byte []buffer=new byte[1024];
		int len=0;
		while((len=fis.read(buffer))>0){
			fos.write(buffer,0,len);
		}
		System.out.println("1");
		cxt.getSession().put("hasUpload", "true");
		cxt.getSession().put("pic_uri", "/BookStoreStruts/data/bookpic/"+cxt.getSession().get("username")+"/"+time+".png");
		return SUCCESS;
	}
	
}

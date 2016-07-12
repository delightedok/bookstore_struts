package bookstore.filter;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class UrlSession implements Interceptor{
	
	public void init(){
		
	}
	public void destroy(){
		
	}
	public String intercept(ActionInvocation invocation) throws Exception{
		ActionContext context=invocation.getInvocationContext();
		Map<String,Object> session=context.getSession();
		
		HttpServletRequest request=ServletActionContext.getRequest();
		String path=request.getRequestURI().substring(10);
		session.put("uri", path);
		return "success";
	}

}

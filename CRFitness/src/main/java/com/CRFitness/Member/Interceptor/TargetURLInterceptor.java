package com.CRFitness.Member.Interceptor;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class TargetURLInterceptor extends AbstractInterceptor {  
  
    private static final long serialVersionUID = 5421682585093337518L;  
  
    @Override  
    public String intercept(ActionInvocation invocation) throws Exception {  
  
        Object obj = invocation.getAction();  
        if (obj instanceof TargetURLAware) {  
            HttpServletRequest request = ServletActionContext.getRequest();  
  
            String contextPath = request.getContextPath();  
            String preURL = request.getHeader("referer");//由哪個網頁連結到這 ps.推薦者  
            if (preURL == null)  
                ((TargetURLAware) obj).setPreURL(null);  
            else {  
                int begin = preURL.indexOf(contextPath);  
                preURL = preURL.substring(begin + contextPath.length());  
                ((TargetURLAware) obj).setPreURL(preURL);  
            }  
        }  
        return invocation.invoke();  
    }  
}  
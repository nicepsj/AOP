package com.multi.erp.etc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//컨트롤러가 실행되는 시간을 측정(요청ip출력)
public class TimeCheckInterceptor extends HandlerInterceptorAdapter{
	private long start;
	private long end;
	//컨트롤러 호출 전에 호출되는 메소드(HandlerAdapter호출 전에 )
	//return true이면 다음으로 진행된다.
	//false이면 더 진행하지 않는다.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("==================preHandle=========================");
		System.out.println("접속한 ip:"+request.getRemoteHost());
		start = System.nanoTime();
		return true;
	}

	//컨트롤러 실행 후에 호출되는 메소드((HandlerAdapter호출 후에 )
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		end = System.nanoTime();
		System.out.println("******************postHandle**************************");
		String handlerClass = handler.getClass().getName();
		System.out.println("실행객체:"+handlerClass+",실행시간=>"+(end-start));
	}

	//뷰가 렌더링된 후에 호출
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}
	
	
	
}

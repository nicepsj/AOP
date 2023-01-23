package com.multi.erp.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

//공통관심사항을 정의할 클래스- Advice
@Component
//aop를 적용할 advice임을 나타내는 어노테이션기호(aop로 서비스할 클래스 - 공통모듈이라는 의미)
@Aspect
public class TimeCheckAdvice {
	//공통로직이 어떤 핵심로직에서 실행될 것인지 정의,어느 시점에 실행될 것인지 정의
	//@Around는 메소드 실행전 메소드 실행 후에 모두 호출
	//board패키지의 모든 클래스의 모든 메소드에 적용하겠다는 의미
	//@Around("execution(* com.multi.erp.board..*(..))")
	@Around("execution(* com.multi.erp.board..*Service*.*(..))")
	public Object execute(ProceedingJoinPoint joinpoint) throws Throwable {
		long start = System.currentTimeMillis();
		Object obj = null;
		try {
			System.out.println("START:::::::::::::::::aop시작"+joinpoint.toString());
			//핵심로직이 구현된 메소드가 호출된다.
			obj = joinpoint.proceed();
			return obj;
		}finally {
			long end = System.currentTimeMillis();
			System.out.println("END======================="+joinpoint.toString()+"======"+(end-start));
		}
	}
}

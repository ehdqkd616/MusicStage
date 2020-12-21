package com.musicstage.spring.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.musicstage.spring.member.model.vo.Member;

//로그인을 하지 않으면 게시판 요청을 했을 때 "로그인 후 이용하세요"라는 경고메세지를 띄운 후 메인화면으로 가게 만드는 Interceptor
public class AdminInterceptor extends HandlerInterceptorAdapter{

	private static final Logger logger = LoggerFactory.getLogger(AdminInterceptor.class);
	

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.info("=============== AdminInterceptor START ==================");
		logger.info(" URI [{}], " + request.getRequestURI());
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser == null){
			request.setAttribute("msg", "로그인 후 이용하세요.");
			request.getRequestDispatcher("WEB-INF/views/home.jsp").forward(request, response);
			return false;
		}else if(loginUser.getAuthority() != 99) {
			request.setAttribute("msg", "관리자 권한으로만 접근 가능합니다.");
			request.getRequestDispatcher("WEB-INF/views/home.jsp").forward(request, response);
			return false;
		}
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// Controller엥서 DispatcherServlet으로 리턴되는 순간에 수행
		
		logger.info("=============== AdminInterceptor END ==================");
		super.postHandle(request, response, handler, modelAndView);
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// 최종 결과를 생성하는 일을 포함한 모든 작업이 완료된 후
		super.afterCompletion(request, response, handler, ex);
	}

	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		super.afterConcurrentHandlingStarted(request, response, handler);
	}
	
}
	
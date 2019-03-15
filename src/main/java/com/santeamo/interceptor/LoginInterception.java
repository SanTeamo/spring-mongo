package com.santeamo.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterception implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        Object object = request.getSession().getAttribute("loginUser");
        //System.out.println(object);
        if (object==null) {
            System.out.println("未登录！");

            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write("<script type='text/javascript'>alert('请先登录!');window.location.href='/Home/toLogin'</script>");

            //request.getRequestDispatcher("/Home/toLogin").forward(request, response);
            return false;
        } else {
            return true;
        }

    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}

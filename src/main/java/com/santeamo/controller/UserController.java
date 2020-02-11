package com.santeamo.controller;

import com.santeamo.model.User;
import com.santeamo.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/Home")
public class UserController {

    @Resource
    private UserService userService;

    @RequestMapping(value = {"/toLogin",""})
    public String toLogin() {
        return "login";
    }

    @RequestMapping("/toRegist")
    public String toRegist() {
        return "register";
    }

    @RequestMapping("/login")
    public String login(String username, String password, HttpServletRequest request) {

        User user = userService.findUserByUnameandPwd(username,password);
        //根据用户名和密码查询用户
        if (user!=null){
            request.getSession().setAttribute("loginUser",user);//存入session
            if (user.getType()==1){
                return "redirect:/index";//是用户返回首页
            }else {
                return "redirect:/Admin/main";//是管理员或卖家返回后台
            }
        }else {
            request.setAttribute("msg","用户名或密码错误");
            return "login";
        }
    }

    @RequestMapping("/regist")
    public String register(User user){
        userService.insert(user);//插入用户数据
        return "login";//返回登录页面

    }

    @RequestMapping("/checkUsername")
    @ResponseBody
    public Boolean checkUsername(String username){
        return userService.checkUsername(username);
    }

    @RequestMapping("/logOut")
    public String logOut(HttpSession session) {

        session.invalidate();

        return "redirect:/index";
    }

}

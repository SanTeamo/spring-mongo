package com.santeamo.controller;

import com.santeamo.model.User;
import com.santeamo.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/Admin")
public class AdminController {

    @Resource
    private UserService userService;

    @RequestMapping(value = {"/toLogin",""})
    public String toLogin() {
        return "admin/login";
    }

    @RequestMapping("/login")
    public String login(String username, String password, HttpServletRequest request) {

        User user = userService.findUserByUnameandPwd(username,password);

        if (user!=null){
            if (user.getType()!=1){
                request.getSession().setAttribute("loginUser",user);
                return "redirect:main";
            }else {
                return "redirect:/toLogin";
            }
        }else {
            request.setAttribute("msg","用户名或密码错误");
            return "admin/login";

        }


    }

    @RequestMapping("/logOut")
    public String logOut(HttpSession session) {

        session.invalidate();

        return "redirect:toLogin";
    }

    @RequestMapping("/main")
    public String main() {

        return "admin/main";
    }

    @RequestMapping("/index")
    public String index() {

        return "admin/index";
    }

}

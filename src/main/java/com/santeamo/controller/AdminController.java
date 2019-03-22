package com.santeamo.controller;

import com.santeamo.model.User;
import com.santeamo.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
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
    public String login(String username, String password, HttpSession session) {

        User user = userService.findUserByUnameandPwd(username,password);

        if (user.getType()!=1){
            session.setAttribute("loginUser",user);
            return "redirect:main";
        }

        return "redirect:toLogin";
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

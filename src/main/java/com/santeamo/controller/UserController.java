package com.santeamo.controller;

import com.santeamo.model.User;
import com.santeamo.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
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
    public String login(String username, String password, HttpSession session) {

        //System.out.println("username:"+username+" , password:"+password);

        User user = userService.findUserByUnameandPwd(username,password);

        //System.out.println(user);

        if (user.getType()==1){
            session.setAttribute("loginUser",user);

        }
        return "redirect:/index";
    }

    @RequestMapping("/regist")
    public String register(User user){

        System.out.println(user.toString());
        userService.insert(user);
        return "login";

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

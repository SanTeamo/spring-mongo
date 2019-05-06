package com.santeamo.controller;

import com.santeamo.model.Product;
import com.santeamo.model.User;
import com.santeamo.service.ProductService;
import com.santeamo.service.UserService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/Admin")
public class AdminController {

    @Resource
    private UserService userService;

    @Resource
    private ProductService productService;

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

    @RequestMapping("userlist")
    public String findUser(HttpServletRequest request, User user,@PageableDefault(value = 12) Pageable pageable){
        Pageable pageRequest = new PageRequest(pageable.getPageNumber()==0?0:pageable.getPageNumber()-1,12);
        Page<User> page = userService.queryWithPage(user,pageRequest);
        request.setAttribute("page",page);
        return "admin/userlist";
    }

    @RequestMapping("productlist")
    //@ResponseBody
    public String getProductsByCatId(Integer catId, Model model, @PageableDefault(value = 12) Pageable pageable){

        Pageable pageRequest = new PageRequest(pageable.getPageNumber()==0?0:pageable.getPageNumber()-1,12);

        Page<Product> page = productService.queryWithPage(catId,pageRequest);

        model.addAttribute("page",page);
        return "admin/productlist";
    }

    @RequestMapping("updateuser")
    public String updateuser(User user){
        userService.saveOrUpdate(user);
        return "redirect:/Admin/userlist";
    }

}

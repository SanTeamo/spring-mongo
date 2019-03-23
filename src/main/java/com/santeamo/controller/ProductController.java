package com.santeamo.controller;

import com.santeamo.model.Evaluation;
import com.santeamo.model.Product;
import com.santeamo.model.User;
import com.santeamo.service.ProductService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/Product")
public class ProductController {

    @Resource
    private ProductService productService;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView ProductIndex(){

        ModelAndView modelAndView = new ModelAndView();

        List<Product> list = productService.getProducts();

        modelAndView.addObject("list",list);
        modelAndView.setViewName("product_list");

        return modelAndView;
    }

    @RequestMapping("/catId/{catId}")
    //@ResponseBody
    public String getProductsByCatId(@PathVariable Integer catId, Model model,@PageableDefault(value = 12) Pageable pageable){

        Pageable pageRequest = new PageRequest(pageable.getPageNumber()==0?0:pageable.getPageNumber()-1,12);

        Page<Product> page = productService.getProductsByCatId(catId,pageRequest);

        model.addAttribute("page",page);
        //model.addAttribute("catId",null);
        return "product_list";
        //return page;
    }

    @RequestMapping("/catId/{catId}/id/{id}")
    public String getProductByCatIdAndPid(@PathVariable String id, Model model){

        Product product = productService.getProductByPid(id);

        Evaluation evaluation = productService.getEvaluationByPid(product.getId());
        System.out.println(evaluation);

        model.addAttribute("product",product);
        model.addAttribute("comments",evaluation.getComments());

        return "product_info";
    }

    @RequestMapping("/addProduct")
    public String addProduct(Product product, MultipartFile pimagefile, MultipartFile pdescImagefile, HttpSession session){

        User user = (User) session.getAttribute("loginUser");
        product.setOwnerUserName(user.getUsername());
        String pathRoot = session.getServletContext().getRealPath("");
        String path="";
        if(!pimagefile.isEmpty()){
            //图片新名字
            String newName = UUID.randomUUID().toString().replaceAll("-","");
            //图片原有名字
            String oldName = pimagefile.getOriginalFilename();
            //图片后缀
            String suffix = oldName.substring(oldName.lastIndexOf("."));
            path="/products/"+newName+suffix;
            try {
                pimagefile.transferTo(new File(pathRoot+path));
                product.setPimage(newName+suffix);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if(!pdescImagefile.isEmpty()){
            //图片新名字
            String newName = UUID.randomUUID().toString().replaceAll("-","");
            //图片原有名字
            String oldName = pdescImagefile.getOriginalFilename();
            //图片后缀
            String suffix = oldName.substring(oldName.lastIndexOf("."));
            path="/products/"+newName+suffix;
            try {
                pdescImagefile.transferTo(new File(pathRoot+path));
                product.setPdescImage(newName+suffix);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        System.out.println(product);
        productService.saveOrUpdate(product);

        return "redirect:/Shop";
    }

    @RequestMapping("/edit/{id}")
    public String editUI(@PathVariable String id, HttpServletRequest request){

        Product product = productService.getProductByPid(id);

        request.setAttribute("product",product);

        return "admin/product_info";
    }

    @RequestMapping("/updateProduct")
    public String updateProduct(Product product, MultipartFile pimagefile, MultipartFile pdescImagefile, HttpSession session){
        String pathRoot = session.getServletContext().getRealPath("");
        String path="";
        Product preProduct = productService.getProductByPid(product.getId());
        product.setPimage(preProduct.getPimage());
        product.setPimage(preProduct.getPdescImage());
        if(!pimagefile.isEmpty()){
            //图片新名字
            String newName = UUID.randomUUID().toString().replaceAll("-","");
            //图片原有名字
            String oldName = pimagefile.getOriginalFilename();
            //图片后缀
            String suffix = oldName.substring(oldName.lastIndexOf("."));
            path="/products/"+newName+suffix;
            try {
                pimagefile.transferTo(new File(pathRoot+path));
                product.setPimage(newName+suffix);
                File file = new File(pathRoot+"/products/"+preProduct.getPimage());
                if (file.exists()){
                    file.delete();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if(!pdescImagefile.isEmpty()){
            //图片新名字
            String newName = UUID.randomUUID().toString().replaceAll("-","");
            //图片原有名字
            String oldName = pdescImagefile.getOriginalFilename();
            //图片后缀
            String suffix = oldName.substring(oldName.lastIndexOf("."));
            path="/products/"+newName+suffix;
            try {
                pdescImagefile.transferTo(new File(pathRoot+path));
                product.setPdescImage(newName+suffix);
                File file = new File(pathRoot+"/products/"+preProduct.getPdescImage());
                if (file.exists()){
                    System.out.println(file.getAbsolutePath());
                    file.delete();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        System.out.println(product);
        productService.saveOrUpdate(product);

        return "redirect:/Shop";
    }

}

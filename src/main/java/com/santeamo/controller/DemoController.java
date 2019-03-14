package com.santeamo.controller;

import javax.annotation.Resource;

import com.santeamo.model.Product;
import com.santeamo.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.santeamo.model.User;
import com.santeamo.service.UserService;

import java.util.Date;

@Controller
@RequestMapping("/demo")
public class DemoController {
	@Resource
	private UserService userService;
	@Resource
	private ProductService productService;
	/**
	 * jsp view test
	 */
	@RequestMapping("/test")
	public String demoTest(){
		return "demo";
	}
	/**
	 * json to string test
	 */
	@RequestMapping(value = "/json",produces = "application/json; charset=utf-8")
	public @ResponseBody String jsonTest(){
		return "你好";
	}
	/**
	 * json object test
	 */
	@RequestMapping("/jsonObject")
	public @ResponseBody Integer jsonObjectTest(){
		return new Integer(5);
	}

	@RequestMapping("/testDay")
	public String add(Date day){
		System.out.println(day);
		return "add";
	}

}

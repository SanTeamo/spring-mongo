package com.santeamo.controller;

import com.mongodb.gridfs.GridFSDBFile;
import com.santeamo.service.ImageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.OutputStream;

@Controller
@RequestMapping("/Image")
public class ImageController {
    @Resource
    ImageService imageService;

    @RequestMapping("/savePicTest")
    public String savePicTest(){

        File file = new File("D:\\pic\\7Q5-g2ibXrZ7jT3cS1hc-s9.jpg");

        imageService.savePic(file,"mypic.jpg","pimage");

        return "redirect:/index";
    }

    @RequestMapping(value = "/picShowTest")
    public void picShowTest(HttpServletRequest request, HttpServletResponse response){
        try {
            OutputStream out = response.getOutputStream();
            response.setContentType("image/jpg");
            GridFSDBFile file = imageService.findPic("mypictest.jpg","pimage");
            file.writeTo(out);
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @RequestMapping(value = "/{imageUrl}")
    public void findPic(@PathVariable String imageUrl, HttpServletRequest request, HttpServletResponse response){
        try {
            GridFSDBFile file = imageService.findPic(imageUrl+".jpg","pimage");
            OutputStream out = response.getOutputStream();
            response.setContentType("image/"+file.getContentType().replace(".",""));
            file.writeTo(out);
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}

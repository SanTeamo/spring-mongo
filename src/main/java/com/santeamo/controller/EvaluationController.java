package com.santeamo.controller;

import com.santeamo.model.Comment;
import com.santeamo.model.Evaluation;
import com.santeamo.model.Product;
import com.santeamo.service.EvaluationService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.UUID;

@Controller
@RequestMapping("/Evaluation")
public class EvaluationController {

    @Resource
    private EvaluationService evaluationService;

    @RequestMapping("/addEvaluationTest")
    public String addEvaluationTest(){

        Comment comment1 = new Comment();
        comment1.setCommentTime(new Date());
        comment1.setUsername("admin");
        comment1.setDescription("很好，物流有点慢");
        comment1.setDescScore(10);
        comment1.setServiceScore(10);
        comment1.setLogisticsScore(6);

        Evaluation evaluation = new Evaluation();
        evaluation.getComments().add(comment1);

        Comment comment2 = new Comment();
        comment2.setCommentTime(new Date());
        comment2.setUsername("admin");
        comment2.setDescription("很好，物流有点慢");
        comment2.setDescScore(10);
        comment2.setServiceScore(10);
        comment2.setLogisticsScore(6);

        evaluation.getComments().add(comment2);

        //System.out.println(evaluation);

        evaluation.setPid("5c8b5089ca1040531aac88bc");

        evaluationService.addEvaluation(evaluation);

        return "redirect:/index";
    }

    @RequestMapping("/id/{id}")
    @ResponseBody
    //@RequestMapping("getEvaluationByEvalId")
    public Evaluation getEvaluation(@PathVariable String id){

        Evaluation evaluation = evaluationService.getEvaluationById(id);

        //System.out.println(evaluation);

        return evaluation;
    }

    @RequestMapping("/Comment/{pid}")
    public String goCommentOrder(@PathVariable String pid, Model model){

        //System.out.println(pid);
        Product product = evaluationService.getProductByPid(pid);
        model.addAttribute("product",product);

        return "user/comment";
    }

    @RequestMapping("/writeComment")
    public String comment(Evaluation evaluation, Model model){

        System.out.println(evaluation);

        return "user/comment";
    }

}

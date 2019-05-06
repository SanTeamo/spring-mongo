package com.santeamo.controller;

import com.santeamo.model.Comment;
import com.santeamo.model.Evaluation;
import com.santeamo.model.Product;
import com.santeamo.service.EvaluationService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;

@Controller
@RequestMapping("/Evaluation")
public class EvaluationController {

    @Resource
    private EvaluationService evaluationService;

    @RequestMapping("/id/{id}")
    @ResponseBody
    //@RequestMapping("getEvaluationByEvalId")
    public Evaluation getEvaluation(@PathVariable String id){

        Evaluation evaluation = evaluationService.getEvaluationById(id);

        //System.out.println(evaluation);

        return evaluation;
    }

    @RequestMapping("/Comment/oid/{oid}/pid/{pid}")
    public String goCommentOrder(@PathVariable String oid, @PathVariable String pid, Model model){

        //System.out.println(pid);
        Product product = evaluationService.getProductByPid(pid);
        model.addAttribute("product",product);
        model.addAttribute("oid",oid);

        return "user/comment";
    }

    @RequestMapping("/writeComment")
    public String comment(Evaluation evaluation, String oid){

        //System.out.println(evaluation);

        evaluationService.addComment(evaluation,oid);

        return "redirect:/Home/Order";
    }

}

package com.santeamo.controller;

import com.santeamo.model.Comment;
import com.santeamo.model.Evaluation;
import com.santeamo.service.EvaluationService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.UUID;

@Controller
@RequestMapping("Evaluation")
public class EvaluationController {

    @Resource
    private EvaluationService evaluationService;

    @RequestMapping("addEvaluationTest")
    public String addEvaluationTest(){

        Comment comment1 = new Comment();
        comment1.setScore(9);
        comment1.setDescription("非常好");
        comment1.setUsername("admin");
        comment1.setCommentTime(new Date());

        Evaluation evaluation = new Evaluation();
        evaluation.getComments().add(comment1);

        Comment comment2 = new Comment();
        comment2.setScore(1);
        comment2.setDescription("不行");
        comment2.setUsername("admin");
        comment2.setCommentTime(new Date());

        evaluation.getComments().add(comment2);

        System.out.println(evaluation);

        evaluationService.addEvaluation(evaluation);

        return "redirect:/index";
    }

    @RequestMapping("/{id}")
    @ResponseBody
    //@RequestMapping("getEvaluationByEvalId")
    public Evaluation getEvaluation(@PathVariable String id){

        Evaluation evaluation = evaluationService.getEvaluationById(id);

        //System.out.println(evaluation);

        return evaluation;
    }

}

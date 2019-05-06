package com.santeamo.dao;


import com.santeamo.model.Comment;
import com.santeamo.model.Evaluation;

public interface EvaluationDao extends BaseDao {

    Evaluation getEvaluationById(String id);

    Evaluation findByPid(Class<Evaluation> evaluationClass, String pid);

    void addComment(Comment comment, String id);
}

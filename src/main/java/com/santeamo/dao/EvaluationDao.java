package com.santeamo.dao;


import com.santeamo.model.Evaluation;

public interface EvaluationDao extends BaseDao {

    public void addEvaluation(Evaluation evaluation);

    public Evaluation getEvaluationById(String id);

}

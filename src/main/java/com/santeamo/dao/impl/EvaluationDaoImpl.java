package com.santeamo.dao.impl;

import com.santeamo.dao.EvaluationDao;
import com.santeamo.model.Evaluation;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

@Repository("evaluationDao")
public class EvaluationDaoImpl extends MongoDBBaseDao implements EvaluationDao {

    @Override
    public void addEvaluation(Evaluation evaluation){
        mongoTemplate.insert(evaluation);
    }

    @Override
    public Evaluation getEvaluationById(String id){
        Evaluation evaluation = new Evaluation();
        evaluation = mongoTemplate.findOne(new Query(Criteria.where("_id").is(id)),Evaluation.class);
        return evaluation;
    }
}

package com.santeamo.dao.impl;

import com.santeamo.dao.EvaluationDao;
import com.santeamo.model.Comment;
import com.santeamo.model.Evaluation;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

@Repository("evaluationDao")
public class EvaluationDaoImpl extends MongoDBBaseDao implements EvaluationDao {

    @Override
    public Evaluation getEvaluationById(String id){
        Evaluation evaluation = new Evaluation();
        evaluation = mongoTemplate.findOne(new Query(Criteria.where("_id").is(id)),Evaluation.class);
        return evaluation;
    }

    @Override
    public Evaluation findByPid(Class<Evaluation> evaluationClass, String pid) {
        return mongoTemplate.findOne(new Query(Criteria.where("pid").is(pid)),Evaluation.class);
    }

    @Override
    public void addComment(Comment comment, String id) {
        Query insertquery = new Query(Criteria.where("pid").is(id));
        Update update = new Update();
        update.addToSet("comments", comment);
        mongoTemplate.upsert(insertquery,update,Evaluation.class);
    }
}

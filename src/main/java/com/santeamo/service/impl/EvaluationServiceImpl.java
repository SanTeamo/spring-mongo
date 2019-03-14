package com.santeamo.service.impl;

import com.santeamo.dao.EvaluationDao;
import com.santeamo.model.Evaluation;
import com.santeamo.service.EvaluationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class EvaluationServiceImpl implements EvaluationService {
    @Resource
    private EvaluationDao dao;

    @Override
    public void addEvaluation(Evaluation evaluation) {
        dao.addEvaluation(evaluation);
    }

    @Override
    public Evaluation getEvaluationById(String id) {
        return dao.getEvaluationById(id);
    }
}

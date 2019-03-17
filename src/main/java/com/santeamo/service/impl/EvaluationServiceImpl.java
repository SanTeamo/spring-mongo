package com.santeamo.service.impl;

import com.santeamo.dao.EvaluationDao;
import com.santeamo.dao.ProductDao;
import com.santeamo.model.Evaluation;
import com.santeamo.model.Product;
import com.santeamo.service.EvaluationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class EvaluationServiceImpl implements EvaluationService {
    @Resource
    private EvaluationDao evaluationDao;

    @Resource
    private ProductDao productDao;

    @Override
    public void addEvaluation(Evaluation evaluation) {
        evaluationDao.addEvaluation(evaluation);
    }

    @Override
    public Evaluation getEvaluationById(String id) {
        return evaluationDao.getEvaluationById(id);
    }

    @Override
    public Product getProductByPid(String pid) {
        return productDao.getProductByPid(pid);
    }
}

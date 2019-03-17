package com.santeamo.service;

import com.santeamo.model.Evaluation;
import com.santeamo.model.Product;

public interface EvaluationService {
    void addEvaluation(Evaluation evaluation);

    Evaluation getEvaluationById(String id);

    Product getProductByPid(String pid);
}

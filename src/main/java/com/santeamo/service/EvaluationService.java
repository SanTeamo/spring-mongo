package com.santeamo.service;

import com.santeamo.model.Evaluation;
import com.santeamo.model.Product;

public interface EvaluationService {
    Evaluation getEvaluationById(String id);

    Product getProductByPid(String pid);

    void addComment(Evaluation evaluation, String oid);
}

package com.santeamo.service;

import com.santeamo.model.Evaluation;

public interface EvaluationService {
    public void addEvaluation(Evaluation evaluation);
    public Evaluation getEvaluationById(String id);
}

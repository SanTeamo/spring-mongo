package com.santeamo.service;

import com.santeamo.model.Evaluation;
import com.santeamo.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ProductService extends BaseService {

    List<Product> getProducts();

    Product getProductByPid(String id);

    Evaluation getEvaluationByEvalId(String evalId);

    Page<Product> getProductsByCatId(Integer catId, Pageable pageable);
}

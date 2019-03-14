package com.santeamo.service.impl;

import com.santeamo.dao.EvaluationDao;
import com.santeamo.dao.ProductDao;
import com.santeamo.model.Evaluation;
import com.santeamo.model.Product;
import com.santeamo.service.ProductService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Resource
    private ProductDao productDao;

    @Resource
    private EvaluationDao evaluationDao;

    @Override
    public void save(Product product) {
        productDao.saveOrUpdate(product);
    }

    @Override
    public List<Product> getProducts() {
        return productDao.findAll(Product.class);
    }

    @Override
    public Page<Product> getProductsByCatId(Integer catId, Pageable pageable) {
        return productDao.getProductsByCatId(catId, pageable);
    }

    @Override
    public Product getProductByPid(String id) {
        return productDao.getProductByPid(id);
    }

    @Override
    public Evaluation getEvaluationByEvalId(String evalId) {
        return evaluationDao.findById(Evaluation.class,evalId);
    }
}

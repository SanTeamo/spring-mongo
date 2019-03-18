package com.santeamo.service.impl;

import com.mongodb.gridfs.GridFSDBFile;
import com.santeamo.dao.EvaluationDao;
import com.santeamo.dao.ImageDao;
import com.santeamo.dao.ProductDao;
import com.santeamo.model.Evaluation;
import com.santeamo.model.Product;
import com.santeamo.service.ProductService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.File;
import java.util.List;

@Service
public class ProductServiceImpl extends BaseServiceImpl implements ProductService {

    @Resource
    private ProductDao productDao;

    @Resource
    private EvaluationDao evaluationDao;

    @Resource
    private ImageDao imageDao;

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

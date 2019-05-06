package com.santeamo.service.impl;

import com.santeamo.dao.EvaluationDao;
import com.santeamo.dao.ProductDao;
import com.santeamo.model.Evaluation;
import com.santeamo.model.Product;
import com.santeamo.service.ProductService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.regex.Pattern;

@Service
public class ProductServiceImpl extends BaseServiceImpl implements ProductService {

    @Resource
    private ProductDao productDao;

    @Resource
    private EvaluationDao evaluationDao;

    @Override
    public List<Product> getProducts() {
        return productDao.findAll(Product.class);
    }

    @Override
    public Page<Product> getProductsByCatId(Integer catId, Pageable pageable) {
        Query query = new Query(Criteria.where("catId").is(catId));
        return productDao.getProductsByQuery(query,pageable);
    }

    @Override
    public Page<Product> queryWithPage(Integer catId, Pageable pageable) {
        Query query = new Query();
        return productDao.getProductsByQuery(query,pageable);
    }

    @Override
    public Page<Product> search(String keyword, Pageable pageable) {
        Pattern pattern=Pattern.compile(".*"+keyword+".*", Pattern.CASE_INSENSITIVE);
        Query query = new Query(Criteria.where("pname").regex(pattern));
        return productDao.getProductsByQuery(query,pageable);
    }

    @Override
    public List<Product> getHots() {
        return null;
    }

    @Override
    public Product getProductByPid(String id) {
        return productDao.getProductByPid(id);
    }

    @Override
    public Evaluation getEvaluationByPid(String pid) {

        Evaluation evaluation = evaluationDao.findByPid(Evaluation.class,pid);

        if (evaluation==null){
            evaluation = new Evaluation();
            evaluation.setPid(pid);
            evaluationDao.insert(evaluation);
        }
        return evaluation;
    }

}

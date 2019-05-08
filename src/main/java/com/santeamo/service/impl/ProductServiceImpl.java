package com.santeamo.service.impl;

import com.santeamo.dao.EvaluationDao;
import com.santeamo.dao.ProductDao;
import com.santeamo.model.Chart;
import com.santeamo.model.Evaluation;
import com.santeamo.model.Product;
import com.santeamo.model.User;
import com.santeamo.service.ProductService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.regex.Pattern;

import static org.springframework.data.mongodb.core.aggregation.Aggregation.group;
import static org.springframework.data.mongodb.core.aggregation.Aggregation.match;

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
        Query query = new Query();
        query.with(new Sort(Sort.Direction.DESC,"sales"));
        Page<Product> page = productDao.getProductsByQuery(query, new PageRequest(0,12));
        return page.getContent();
    }

    @Override
    public Chart getChart(User user) {

        Query query = new Query();
        if (user.getType()==2){
            query.addCriteria(Criteria.where("ownerUserName").is(user.getUsername()));
        }
        query.with(new Sort(Sort.Direction.DESC,"sales"));
        Page<Product> page = productDao.getProductsByQuery(query, new PageRequest(0,12));
        Chart chart = pageToChart(page);
        return chart;
    }

    private Chart pageToChart(Page page){
        List<Product> list = page.getContent();
        Chart chart = new Chart();
        for (Product product : list){
            chart.getCategories().add(product.getPname());
            chart.getData().add(product.getSales());
        }
        return chart;
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

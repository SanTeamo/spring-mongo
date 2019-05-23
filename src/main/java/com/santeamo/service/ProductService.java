package com.santeamo.service;

import com.santeamo.model.Chart;
import com.santeamo.model.Evaluation;
import com.santeamo.model.Product;
import com.santeamo.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ProductService extends BaseService {

    List<Product> getProducts();

    Product getProductByPid(String id);

    Evaluation getEvaluationByPid(String pid);

    Page<Product> getProductsByCatId(Integer catId, Pageable pageable);

    Page<Product> queryWithPage(Integer catId, Pageable pageRequest);

    Page<Product> search(String keyword, Pageable pageable);

    List<Product> getHots();

    Chart getChart(User user);

    Page<Product> sameProduct(String pname,String pid,Integer catId,Pageable pageable);
}

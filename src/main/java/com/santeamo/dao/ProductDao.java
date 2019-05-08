package com.santeamo.dao;

import com.santeamo.model.Product;
import com.santeamo.model.ProductWrapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.query.Query;

import java.util.List;

public interface ProductDao extends BaseDao {

    Product getProductByPid(String id);

    Page<Product> getProductsByQuery(Query query, Pageable pageable);

    void saleAdd(List<ProductWrapper> productWrappers);
}

package com.santeamo.dao;

import com.santeamo.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.core.query.Query;

public interface ProductDao extends BaseDao {

    Product getProductByPid(String id);

    Page<Product> getProductsByQuery(Query query, Pageable pageable);
}

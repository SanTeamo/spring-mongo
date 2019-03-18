package com.santeamo.dao;

import com.santeamo.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface ProductDao extends BaseDao {

    Product getProductByPid(String id);

    Page<Product> getProductsByCatId(Integer catId, Pageable pageable);
}

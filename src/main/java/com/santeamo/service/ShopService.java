package com.santeamo.service;

import com.santeamo.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface ShopService extends BaseService {
    Page<Product> getProductsByUserName(String username, Pageable pageable);

    Product getProductByPid(String pid);
}

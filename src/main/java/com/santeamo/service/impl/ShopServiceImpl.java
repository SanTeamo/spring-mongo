package com.santeamo.service.impl;

import com.santeamo.dao.ProductDao;
import com.santeamo.model.Product;
import com.santeamo.service.ShopService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class ShopServiceImpl extends BaseServiceImpl implements ShopService {
    @Resource
    private ProductDao productDao;
    @Override
    public Page<Product> getProductsByUserName(String username, Pageable pageable) {
        Query query = new Query(Criteria.where("ownerUserName").is(username));
        return productDao.getProductsByQuery(query,pageable);
    }

    @Override
    public Product getProductByPid(String pid) {
        return productDao.getProductByPid(pid);
    }
}

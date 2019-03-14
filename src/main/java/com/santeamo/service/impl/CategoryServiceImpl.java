package com.santeamo.service.impl;

import com.santeamo.dao.CategoryDao;
import com.santeamo.model.Category;
import com.santeamo.service.CategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Resource
    private CategoryDao dao;

    @Override
    public List<Category> findAll() {
        return dao.findAll(Category.class);
    }
}

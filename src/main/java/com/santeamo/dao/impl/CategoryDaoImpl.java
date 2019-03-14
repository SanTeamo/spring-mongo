package com.santeamo.dao.impl;

import com.santeamo.dao.CategoryDao;
import org.springframework.stereotype.Repository;

@Repository("categoryDao")
public class CategoryDaoImpl extends MongoDBBaseDao implements CategoryDao {
}

package com.santeamo.service.impl;

import com.santeamo.dao.impl.MongoDBBaseDao;
import com.santeamo.service.BaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class BaseServiceImpl implements BaseService {

    @Resource
    private MongoDBBaseDao mongoDBBaseDao;

    @Override
    public <T> T findById(Class<T> entityClass, String id) {
        return mongoDBBaseDao.findById(entityClass,id);
    }

    @Override
    public <T> T findOne(Class<T> entityClass) {
        return mongoDBBaseDao.findOne(entityClass);
    }

    @Override
    public <T> List<T> findAll(Class<T> entityClass) {
        return mongoDBBaseDao.findAll(entityClass);
    }

    @Override
    public void remove(Object record) {
        mongoDBBaseDao.remove(record);
    }

    @Override
    public void insert(Object record) {
        mongoDBBaseDao.insert(record);
    }

    @Override
    public void saveOrUpdate(Object record) {
        mongoDBBaseDao.saveOrUpdate(record);
    }
}

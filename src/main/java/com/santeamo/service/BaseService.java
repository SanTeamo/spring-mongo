package com.santeamo.service;

import java.util.List;

public interface BaseService {

    <T> T findById(Class<T> entityClass, String id);

    <T> T findOne(Class<T> entityClass);

    <T> List<T> findAll(Class<T> entityClass);

    void remove(Object record);

    void insert(Object record);

    void saveOrUpdate(Object record);
}

package com.santeamo.dao;

import com.santeamo.model.KeyWord;

import java.util.List;

public interface KeyWordDao extends BaseDao {
    List<KeyWord> findByCatId(Integer catId);
}

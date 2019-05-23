package com.santeamo.dao.impl;

import com.santeamo.dao.KeyWordDao;
import com.santeamo.model.KeyWord;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository("keyWordDao")
public class KeyWordDaoImpl extends MongoDBBaseDao implements KeyWordDao {
    @Override
    public List<KeyWord> findByCatId(Integer catId) {
        Query query = new Query(Criteria.where("catId").is(catId));
        return mongoTemplate.find(query,KeyWord.class);
    }
}

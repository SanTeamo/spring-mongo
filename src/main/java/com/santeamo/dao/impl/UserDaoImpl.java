package com.santeamo.dao.impl;

import com.santeamo.dao.UserDao;
import com.santeamo.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("userDao")
public class UserDaoImpl extends MongoDBBaseDao implements UserDao {

    @Override
    public User findUserByUnameandPwd(String username, String password) {

        return mongoTemplate.findOne(new Query(Criteria.where("username").is(username).and("password").is(password)),User.class);
    }

    @Override
    public Boolean checkUsername(String username) {

        User user = mongoTemplate.findOne(new Query(Criteria.where("username").is(username)),User.class);

        if(user!=null){
            return true;
        }

        return false;
    }

    @Override
    public Page<User> getUsersByQuery(Query query, Pageable pageable) {
        long total = mongoTemplate.count(query,User.class);
        List<User> list = mongoTemplate.find(query.with(pageable),User.class);
        Page<User> page = new PageImpl<>(list,pageable,total);
        return page;
    }

}

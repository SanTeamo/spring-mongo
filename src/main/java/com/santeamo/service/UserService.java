package com.santeamo.service;

import com.santeamo.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface UserService extends BaseService {

	User findUserByUnameandPwd(String username, String password);

	Boolean checkUsername(String username);

	Page<User> queryWithPage(User user, Pageable pageRequest);

    Boolean deleteById(String uid);
}

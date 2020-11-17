package com.unicom.dao;

import com.unicom.bean.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO {

    /**
     * 根据 用户名和密码查询用户信息
     * @param username
     * @param password
     * @return 如果返回null,说明用户名或密码错误,反之亦然
     */
     User queryUserByUsernameAndPassword(String username, String password);
}

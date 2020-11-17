package com.unicom.taobao;

import com.unicom.bean.Product;
import com.unicom.bean.User;
import com.unicom.dao.ProductDAO;

import com.unicom.dao.UserDAO;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

@SpringBootTest
class TaobaoApplicationTests {
    @Autowired
    UserDAO userDAO;
    @Test
    void contextLoads() {
    }
    @Autowired
    ProductDAO productDAO;

    @Test
    void queryProductById() {

//        Product product = productDAO.queryProductById(1);
//        System.out.println(product);
//        HashMap<String,String> map=new HashMap();
//        map.put("key","肩章");
//        List<Product> list = productDAO.queryProducts(map);
//        for (Product p:list
//             ) {
//            System.out.println(p);
//        }
//        System.out.println(list);

//        BigDecimal bigDecimal = productDAO.queryMaxPrice();
//        System.out.println(bigDecimal);

//        List<Product> list = productDAO.queryProductsBySize();
//        for (Product p:list
//             ) {
//            System.out.println(p);
//        }
//        final Integer integer = productDAO.queryProductSize();
//        System.out.println(integer);

        final User user = userDAO.queryUserByUsernameAndPassword("heng", "heng");
        System.out.println(user);

    }


}

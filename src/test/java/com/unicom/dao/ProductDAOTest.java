package com.unicom.dao;

import com.unicom.bean.Product;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;

import java.util.List;

class ProductDAOTest {
    @Autowired
    ProductDAO productDAO;
    @Test
    void queryProductById() {
        Product product = productDAO.queryProductById(2);
        System.out.println(product);
    }

    @Test
    void queryProducts() {
//        HashMap map=new HashMap();
//        map.put()
//        List<Product> list = productDAO.queryProducts();
//        System.out.println(list);
    }
}
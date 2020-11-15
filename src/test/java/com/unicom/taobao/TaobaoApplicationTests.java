package com.unicom.taobao;

import com.unicom.bean.Product;
import com.unicom.dao.ProductDAO;
import com.unicom.service.ProductService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class TaobaoApplicationTests {

    @Test
    void contextLoads() {
    }
    @Autowired
    ProductDAO productDAO;
    @Autowired
    ProductService productService;
    @Test
    void queryProductById() {

//        Product product = productDAO.queryProductById(1);
//        System.out.println(product);
//        List<Product> list = productDAO.queryProducts();
//        System.out.println(list);


    }


}

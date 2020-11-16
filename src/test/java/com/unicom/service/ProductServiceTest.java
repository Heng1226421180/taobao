package com.unicom.service;

import com.unicom.bean.Product;
import com.unicom.dao.ProductDAO;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class ProductServiceTest {
    @Autowired
    ProductDAO productDAO;
    @Test
    void queryProducts() {
//        List<Product> list = productDAO.queryProducts();
//        System.out.println(list);
    }
}
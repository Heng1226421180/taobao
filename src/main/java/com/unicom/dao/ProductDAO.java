package com.unicom.dao;

import com.unicom.bean.Product;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
@Repository
public interface ProductDAO {
    Product queryProductById(Integer id);
    List<Product> queryProducts();
}

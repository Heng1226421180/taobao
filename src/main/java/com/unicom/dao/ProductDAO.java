package com.unicom.dao;

import com.unicom.bean.Product;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
@Repository
public interface ProductDAO {
    Product queryProductById(Integer id);
    List<Product> queryProducts(HashMap map);
    List<Product> queryProductsBySize();
    BigDecimal queryMaxPrice();
    BigDecimal queryMinPrice();
    Integer queryProductSize();

}

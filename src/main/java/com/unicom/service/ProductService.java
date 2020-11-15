package com.unicom.service;

import com.unicom.bean.Product;
import com.unicom.dao.ProductDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * @author heibai
 * @date 2020/11/13 19:59
 */
@Service
public class ProductService {
    @Autowired
    ProductDAO productDAO = null;

    /**
     * 得到所有商品列表
     * @param map
     * @return
     */
//    List<Product> queryProducts();
}

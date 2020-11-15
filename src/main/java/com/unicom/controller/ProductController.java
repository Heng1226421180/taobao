package com.unicom.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.unicom.bean.Product;
import com.unicom.dao.ProductDAO;
import com.unicom.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

/**
 * @author heibai
 * @date 2020/11/13 19:15
 */
@Controller
public class ProductController {
    @Autowired
    ProductDAO productDAO;
    @Autowired
    ProductService productService;
    @RequestMapping("product")
    public String userList(HttpServletRequest request,Model model, @RequestParam(defaultValue = "1", value = "pageNum") Integer pageNum) {
        String key = request.getParameter("key");
        HashMap map = new HashMap();
        map.put("key", key);
//
        PageHelper.startPage(pageNum, 10);
        List<Product> list = productDAO.queryProducts();
        PageInfo<Product> pageInfo = new PageInfo<Product>(list);
        model.addAttribute("key", key);
        model.addAttribute("pageInfo", pageInfo);

        List<Product> list1 = productDAO.queryProducts();
        model.addAttribute("products",list1);
        return "product";
    }
}

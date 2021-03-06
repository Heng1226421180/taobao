package com.unicom.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.unicom.bean.Product;
import com.unicom.bean.User;
import com.unicom.dao.ProductDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
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

    @RequestMapping("product")
    public String userList(HttpServletRequest request,Model model, @RequestParam(defaultValue = "1", value = "pageNum") Integer pageNum) {
        User user = (User) request.getSession().getAttribute("user");
        if (user==null){
            return "redirect:login";
        }
        String key = request.getParameter("key");
        HashMap map = new HashMap();
        map.put("key", key);
        //分页，每页显示10条数据，但是现在10无法使用
        PageHelper.startPage(pageNum,10);
        List<Product> list =productDAO.queryProducts(map);
        PageInfo<Product> pageInfo = new PageInfo<>(list);
        model.addAttribute("list",list);
        model.addAttribute("pageInfo", pageInfo);
        List<Product> listBySize = productDAO.queryProductsBySize();
        //toplist有投top10的销量排名
        List<Product> topList=new ArrayList<>();
        HashMap<Integer, String> map1 = new HashMap<>();
        for (int i = 0; i <10 ; i++) {
            topList.add(listBySize.get(i));
        }
        model.addAttribute("topList",topList);
        //将key回显
        model.addAttribute("key", key);
        model.addAttribute("maxPrice",productDAO.queryMaxPrice());

        model.addAttribute("minPrice",productDAO.queryMinPrice());
        //返回总数量
        model.addAttribute("size",productDAO.queryProductSize());
        model.addAttribute("url","product");
        return "index";
    }
}

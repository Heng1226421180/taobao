package com.unicom.controller;


import com.unicom.bean.User;
import com.unicom.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @author heibai
 * @date 2020/7/20 22:08
 */
@Controller
public class UserController {
    @Autowired
    UserDAO userDao;
//    @RequestMapping({"/","/index","index.jsp"})
//    public String hl(){
//        return "forward:/index";
//    }

    /**
     * 登录
     * @param user
     * @param request
     * @return
     */
    @RequestMapping("login")
    public String login(User user, HttpServletRequest request){
        String username = user.getUsername();
        String password = user.getPassword();
        User loginUser = userDao.queryUserByUsernameAndPassword(username, password);
        if (loginUser==null){
            //登录失败，重新登录
            //回显到客户端
            request.setAttribute("msg","用户名或密码错误");
            request.setAttribute("username",username);
            return "login";
        }else {
            //登录成功调转成功的页面
            request.getSession().setAttribute("user",loginUser);
            return "redirect:/product";
//            request.getRequestDispatcher("pages/user/login_success.jsp").forward(request,response);
        }
    }


}

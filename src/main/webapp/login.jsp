﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <%
        String base=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()
                +request.getContextPath()+"/";
        pageContext.setAttribute("basePath",base);
    %>
    <%--${pageContext.getAttribute("base")}--%>
    <base href="<%=base%>">
    <link href="static/css/reset.css" rel="stylesheet" />
    <link href="static/css/index.css" rel="stylesheet" />
    <title>系统登录</title>
</head>

<body>
    <!--header-->
    <div class="header">
        <div class="bg_header">
            <div class="header_nav fl t_title">
                违规销售军事用品大数据中心
            </div>
        </div>
    </div>

    <div class="LoginBox">
        <div class="LoginHead">
            数据中心系统登录
        </div>
        <div class="LoginUserBoxOut ">
            <div class="LoginUserBox mar_top30">
                <input class="LoginUserInput" id="text" value="请输入账号" />
            </div>
        </div>
        <div class="LoginUserBoxOut">
            <div class="LoginUserBox">
                <input class="LoginUserInput" id="pwd" value="请输入密码" />
            </div>
        </div>

        <div class="LoginUserBoxOut">
            <div class="LoginLastBox clearfix">
                <div class="leftBox">
                    <input id="inputcheck" class="inputcheck" type="checkbox" name="inputcheck" />
                    <label for="inputcheck"></label>
                    <span>下次自动登录</span>
                </div>
                <a class="login" href="">
                    登 录
                </a>
            </div>
        </div>

    </div>
    <script src="static/js/login.js"></script>
</body>

</html>
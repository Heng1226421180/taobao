<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link href="static/reset.css" rel="stylesheet" />
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
        <form action="login" method="post">
        <div class="LoginUserBoxOut ">
            <div class="LoginUserBox mar_top30">
                <input class="LoginUserInput" type="text" name="username" placeholder="请输入账号" />
            </div>
        </div>
        <div class="LoginUserBoxOut">
            <div class="LoginUserBox">
                <input class="LoginUserInput" type="password" name="password" placeholder="请输入密码" />
            </div>
        </div>

        <div class="LoginUserBoxOut">
            <div class="LoginLastBox clearfix" align="center">
                <input  type="submit" value="登录" id="sub_btn" />
<%--                <a class="login" href="/login">--%>
<%--                    登 录--%>
<%--                </a>--%>
            </div>
        </div>
        </form>

    </div>
    <script src="js/login.js"></script>
</body>

</html>
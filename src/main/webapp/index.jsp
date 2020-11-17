<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>


<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>大数据中心</title>
   
    <link href="static/css/reset.css" rel="stylesheet" />
    <link href="static/css/iconfont.css" rel="stylesheet" />
    <link href="static/css/index.css" rel="stylesheet" />
    <script src="static/js/jquery-1.9.1.min.js"></script>
    <script src="static/js/f.js"></script>

    <%
        String base=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()
                +request.getContextPath()+"/";
//        pageContext.setAttribute("basePath",base);
    %>
    <%--${pageContext.getAttribute("base")}--%>
    <base href="<%=base%>">
    <link href="static/css/bootstrap.css" rel="stylesheet">
    <link href="static/css/index_.css" rel="stylesheet" >

    <!-- <object data="map.html" type="text/x-scriptlet" style="border: 0px"></object> -->

    <!-- map -->
    <script src="static/js/jquery.min.js"></script>
    <script type="text/javascript" src="static/js/echarts.min.js"></script>
    <script type="text/javascript" src="static/js/map/china.js"></script>
</head>



<body>
    <!--header-->
    <div class="PublicHead clearfix">
        <div class="header">
            <div class="bg_header">
                <div class="header_nav fl t_title">
                    违规销售军事用品大数据中心
                </div>
            </div>
        </div>
    </div>

    <!--main--> 
    <div class="data_content">
        <div class="PublicDownWhole clearfix">

            <!--表格-->
            <div class="RightBox">
                <div class="PublicContentBox">
                    <!--数据名-->
                    <div class="PublicPointToAgeText">
                        <span class="span1">违规销售军品的网页数据 </span>
                    </div>
                    <!--查询-->
                    <div class="InquireBox clearfix">
                        <form style="color: white" action="product" method="post">
                            关键词：<input type="text"  name="key" placeholder="请输入查询的关键词" value="${key}"/>
                            <input type="submit" value="查询" />
                        </form>
<!--                        <div class="InquireleftBox">-->
<!--                            <div class="Text">网址：</div>-->
<!--                            <div class="InputDiv"> <input class="phoneInput" placeholder="请输入查询的网址关键词" /></div>-->
<!--                        </div>-->

<!--                        <div class="PublicBtnIcon Color1Btn fl">-->
<!--                            <i class="iconfont icon-icon-chaxun"></i>-->
<!--                            <span>查询</span>-->
<!--                        </div>-->
                    </div>


                    <div class="InquireTableBox">
                        <!--数据表格-->
                        <div class="InquireSelectTable">
                            <table class="PublicTableCss">
                                <thead>
                                    <tr>
                                        <td>序号</td>
                                        <td>商品名</td>
                                        <td>商品链接</td>
                                        <td>商品价格</td>
                                        <td>成交量</td>
                                        <td>商品图片</td>
                                        <td>店铺名称</td>
                                        <td>店铺网址</td>
                                        <td>店铺地址</td>
                                        <td>店铺图标</td>
                                        <td>命中规则</td>
                                        <td>嫌疑值</td>
                                    </tr>
                                </thead>
                                <tbody class="PublicTableBody">
                                <c:forEach items="${pageInfo.list}" var="product">
                                    <tr >
                                            <td >${product.id}</td>
                                            <td >${product.title}</td>
                                            <td ><a target="_blank" href="${product.itemhref}">${product.itemhref}</a></td>
                                            <td >${product.price}</td>
                                            <td >${product.deal}</td>
                                            <td ><a target="_blank" href="${product.image}">${product.image}</a></td>
                                            <td >${product.shop}</td>
                                            <td ><a target="_blank" href="${product.shophref}">${product.shophref}</a></td>
                                            <td >${product.location}</td>
                                            <td >${product.icons}</td>
                                            <td >${product.itemkeys}</td>
                                            <td >${product.grade}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <%--  分页开始                      --%>
                        <div style="color: #1c69e5" id="page_nav" align="center">
                            <c:if test="${pageInfo.pageNum >1}">
                                <a href="${url}?pageNum=1">首页</a>
                                <a href="${url}?pageNum=${pageInfo.hasPreviousPage==false?1:pageInfo.prePage}">上一页</a>
                            </c:if>

                            <%-- 页码输出的开始--%>
                            <c:choose>
                                <%--    页码少于等于5时--%>
                            <c:when test="${pageInfo.pages<=5}">
                            <c:forEach begin="1" end="${pageInfo.pages}" var="i">
                            <c:if test="${i==pageInfo.pageNum}">
                                【${i}】
                            </c:if>
                            <c:if test="${i!=pageInfo.pageNum}">
                            <a href="${url}?pageNum=${i}">${i}
                                </c:if>
                                </c:forEach>
                                </c:when>
                                    <%--                    页面大于5时--%>
                                <c:when test="${pageInfo.pages>5}">
                                <c:choose>
                                    <%--前三个页面的显示--%>
                                <c:when test="${pageInfo.pageNum<=3}">
                                <c:forEach begin="1" end="5" var="i">
                                <c:if test="${i==pageInfo.pageNum}">
                                【${i}】
                                </c:if>
                                <c:if test="${i!=pageInfo.pageNum}">
                                <a href="${url}?pageNum=${i}">${i}
                                    </c:if>
                                    </c:forEach>
                                    </c:when>
                                        <%--后三个页面的显示--%>
                                    <c:when test="${pageInfo.pageNum>=pageInfo.pages-2}">
                                    <c:forEach begin="${pageInfo.pages-4}" end="${pageInfo.pages}" var="i">
                                    <c:if test="${i==pageInfo.pageNum}">
                                    【${i}】
                                    </c:if>
                                    <c:if test="${i!=pageInfo.pageNum}">
                                    <a href="${url}?pageNum=${i}">${i}
                                        </c:if>
                                        </c:forEach>
                                        </c:when>
                                            <%--其他情况--%>
                                        <c:otherwise>
                                        <c:forEach begin="${pageInfo.pageNum-2}" end="${pageInfo.pageNum+2}" var="i">
                                        <c:if test="${i==pageInfo.pageNum}">
                                        【${i}】
                                        </c:if>
                                        <c:if test="${i!=pageInfo.pageNum}">
                                        <a href="${url}?pageNum=${i}">${i}
                                            </c:if>
                                            </c:forEach>
                                            </c:otherwise>
                                            </c:choose>

                                            </c:when>
                                            </c:choose>

                                            <%-- 页码输出的结束--%>
                                            <c:if test="${pageInfo.pageNum<pageInfo.pages}">
                                            <a href="${url}?pageNum=${pageInfo.hasNextPage==false? pageInfo.pages: pageInfo.nextPage}">下一页</a>
                                            <a href="${url}?pageNum=${pageInfo.pages}">末页</a>
                                            </c:if>
                                            共${pageInfo.pages}页，${pageInfo.total}条记录
                                            到第<input value="${empty param.pageNum?1:param.pageNum}" name="pn" id="pn_input"/>页
                                            <input id="searchPageBtn" type="button" value="确定">

                                            <script type="text/javascript">
                                                $(function () {
                                                    $("#searchPageBtn").click(function () {
                                                        var pageNum=$("#pn_input").val();
                                                        var pages=${pageInfo.pages};
                                                        if (pageNum<1||pageNum>pages){
                                                            alert("跳转页面不合法");
                                                            location.href="${pageContext.getAttribute("basePath")}${url}?pageNum=1";
                                                        }else {
                                                            location.href="${pageContext.getAttribute("basePath")}${url}?pageNum="+pageNum;
                                                        }
                                                    })
                                                })
                                            </script>
                        </div>


                    </div>
                </div>

            </div>
        </div>







        <div class="data_main">
            <div class="main_left fl">
                <div class="left_1 t_btn6">
                    <!--左上边框-->
                    <div class="t_line_box">
                        <i class="t_l_line"></i>
                        <i class="l_t_line"></i>
                    </div>
                    <!--右上边框-->
                    <div class="t_line_box">
                        <i class="t_r_line"></i>
                        <i class="r_t_line"></i>
                    </div>
                    <!--左下边框-->
                    <div class="t_line_box">
                        <i class="l_b_line"></i>
                        <i class="b_l_line"></i>
                    </div>
                    <!--右下边框-->
                    <div class="t_line_box">
                        <i class="r_b_line"></i>
                        <i class="b_r_line"></i>
                    </div>
                    <div class="main_title">
                        <img src="picture/t_1.png" alt="">
                        销量排名
                    </div>
                    <div class="left_top">
                        <table class="left_top_table">
                            <thead class="left_top_table_head">
                                <tr class="">
                                    <th >名次</th>
                                    <th>店铺名</th>
                                    <th>商品名</th>
                                    <th>销量</th>
                                    <th>商品网址</th>
                                </tr>
                            </thead>

                            <tbody class="left_top_table_body">
                            <c:forEach items="${topList}" var="product">
                                <tr class="">
                                    <td >${topList.indexOf(product)+1}</td>
                                    <td>${product.shop}</td>
                                    <td>${product.title}</td>
                                    <td>${product.deal}</td>
                                    <td ><a target="" href="${product.itemhref}">${product.itemhref}</a></td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                    <!-- <div id="chart_1" class="chart" style="width:100%;height: 280px;"></div> -->
                </div>
                <div class="left_2">
                    <div class="t_line_box">
                        <i class="t_l_line"></i>
                        <i class="l_t_line"></i>
                    </div>
                    <div class="t_line_box">
                        <i class="t_r_line"></i>
                        <i class="r_t_line"></i>
                    </div>
                    <div class="t_line_box">
                        <i class="l_b_line"></i>
                        <i class="b_l_line"></i>
                    </div>
                    <div class="t_line_box">
                        <i class="r_b_line"></i>
                        <i class="b_r_line"></i>
                    </div>
                    <div class="main_title">
                        <img src="picture/t_2.png" alt="">
                        商品详情
                    </div>
                    <div class="circle circle_t">
                        <div class="t">违规商品数量<span
                                style="font-size: 25px; color: rgb(216, 149, 4);display: block;">${size}</span>
                        </div>
                    </div>
                    <div class="circle circle_l fl">
                        <div class="l">最高价格<span
                                style="font-size: 25px; color: rgb(216, 4, 4);display: block;">${maxPrice}</span>
                        </div>
                    </div>
                    <div class="circle circle_r fr">
                        <div class="r">最低价格<span
                                style="font-size: 25px; color: rgb(36, 216, 4);display: block;">${minPrice}</span>
                        </div>
                    </div>

                </div>
            </div>
            <div class="main_center fl">
                <div class="center_text" style="position: relative;">
                    <!--左上边框-->
                    <div class="t_line_box">
                        <i class="t_l_line"></i>
                        <i class="l_t_line"></i>
                    </div>
                    <!--右上边框-->
                    <div class="t_line_box">
                        <i class="t_r_line"></i>
                        <i class="r_t_line"></i>
                    </div>
                    <!--左下边框-->
                    <div class="t_line_box">
                        <i class="l_b_line"></i>
                        <i class="b_l_line"></i>
                    </div>
                    <!--右下边框-->
                    <div class="t_line_box">
                        <i class="r_b_line"></i>
                        <i class="b_r_line"></i>
                    </div>
                    <div class="main_title" style="width: 230px;">
                        <img src="picture/t_3.png" alt="">
                        店铺地区分布可视化
                    </div>
                   
                    <div class="box">
                        <button id="back" class="hidden">返回全国</button>
                        <div id="china-map"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>


<!-- 生成动态排名表格 -->
<%--<script>--%>
<%--var datas = [--%>
<%--        {--%>
<%--            no: 1,--%>
<%--            title: '军装',--%>
<%--            itemhref: 'hppt://baidu.com',--%>
<%--            price: 150,--%>
<%--            deal: 10000,--%>
<%--            image: '',--%>
<%--            shop: 'taobao',--%>
<%--            shophref:'',--%>
<%--            location: 'beijing',--%>
<%--            icons: '',--%>
<%--            itemkeys: '',--%>
<%--            grade: ''--%>

<%--        }--%>
<%--        ];--%>
<%--var ptbody = document.querySelector('.PublicTableBody');--%>
<%--    for (var i = 0; i < datas.length; i++) {--%>
<%--        var ptr = document.createElement('tr');--%>
<%--        ptbody.appendChild(ptr);--%>
<%--        for (var k in datas[i]) {--%>
<%--            var ptd = document.createElement('td');--%>
<%--            ptr.appendChild(ptd);--%>
<%--            ptd.innerHTML = datas[i][k];--%>
<%--        }--%>

<%--    }--%>

<%--    var datas = [--%>
<%--        {--%>
<%--            list: 1,--%>
<%--            shop: 'taobao',--%>
<%--            commodit: '军装',--%>
<%--            deal: 10000,--%>
<%--            // href: <a href=''>ggg</a>--%>

<%--        },--%>
<%--        {--%>
<%--            list: 2,--%>
<%--            shop: 'jingdong',--%>
<%--            commodit: '军装',--%>
<%--            deal: 9000,--%>
<%--            href: 'asdfghj'--%>
<%--        },--%>
<%--        {--%>
<%--            list: 3,--%>
<%--            shop: 'xianyu',--%>
<%--            commodit: '军装',--%>
<%--            deal: 5000,--%>
<%--            href: 'jkgjgkhgk'--%>
<%--        },--%>
<%--        {--%>
<%--            list: 4,--%>
<%--            shop: 'weipinhui',--%>
<%--            commodit: '军装',--%>
<%--            deal: 100,--%>
<%--            href: 'asdfghj'--%>
<%--        },--%>
<%--        {--%>
<%--            list: 5,--%>
<%--            shop: '1688',--%>
<%--            commodit: '军装',--%>
<%--            deal: 100,--%>
<%--            href: 'asdfghj'--%>
<%--        },--%>
<%--        {--%>
<%--            list: 6,--%>
<%--            shop: '1688',--%>
<%--            commodit: '军装',--%>
<%--            deal: 100,--%>
<%--            href: 'asdfghj'--%>
<%--        },--%>
<%--        {--%>
<%--            list: 7,--%>
<%--            shop: '1688',--%>
<%--            commodit: '军装',--%>
<%--            deal: 100,--%>
<%--            href: 'asdfghj'--%>
<%--        },--%>
<%--        {--%>
<%--            list: 8,--%>
<%--            shop: '1688',--%>
<%--            commodit: '军装',--%>
<%--            deal: 100,--%>
<%--            href: 'asdfghj'--%>
<%--        }--%>
<%--    ];--%>
<%--    // 在tbody里创建行，几个人就创建几行--%>
<%--    var ltbody = document.querySelector('.left_top_table_body');--%>
<%--    for (var i = 0; i < datas.length; i++) {--%>
<%--        var ltr = document.createElement('tr');--%>
<%--        ltbody.appendChild(ltr);--%>
<%--        for (var k in datas[i]) {--%>
<%--            var ltd = document.createElement('td');--%>
<%--            ltr.appendChild(ltd);--%>
<%--            ltd.innerHTML = datas[i][k];--%>
<%--        }--%>

<%--    }--%>
<%--</script>--%>


<!-- map -->
<script>
    // 金额转换万字单位 start
    function unitConvert(num) {
        if (num) {
            var moneyUnits = ["", "万"],
                dividend = 10000,
                curentNum = num, //转换数字
                curentUnit = moneyUnits[0]; //转换单位 
            for (var i = 0; i < 2; i++) {
                curentUnit = moneyUnits[i];
                if (strNumSize(curentNum) < 5) {
                    return num;
                }
            }
            curentNum = curentNum / dividend;
            var m = {
                num: 0,
                unit: ""
            }
            m.num = curentNum.toFixed(2);
            m.unit = curentUnit;
            return m.num + m.unit;
        }
    }

    function strNumSize(tempNum) {
        var stringNum = tempNum.toString()
        var index = stringNum.indexOf(".")
        var newNum = stringNum
        if (index != -1) {
            newNum = stringNum.substring(0, index)
        }
        return newNum.length;
    }
    // 金额转换万字单位 end
    var myChart = echarts.init(document.getElementById('china-map'));
    var oBack = document.getElementById("back");

    var provinces = ['shanghai', 'hebei', 'shanxi', 'neimenggu', 'liaoning', 'jilin', 'heilongjiang', 'jiangsu', 'zhejiang', 'anhui', 'fujian', 'jiangxi', 'shandong', 'henan', 'hubei', 'hunan', 'guangdong', 'guangxi', 'hainan', 'sichuan', 'guizhou', 'yunnan', 'xizang', 'shanxi1', 'gansu', 'qinghai', 'ningxia', 'xinjiang', 'beijing', 'tianjin', 'chongqing', 'xianggang', 'aomen'];
    var provincesText = ['上海', '河北', '山西', '内蒙古', '辽宁', '吉林', '黑龙江', '江苏', '浙江', '安徽', '福建', '江西', '山东', '河南', '湖北', '湖南', '广东', '广西', '海南', '四川', '贵州', '云南', '西藏', '陕西', '甘肃', '青海', '宁夏', '新疆', '北京', '天津', '重庆', '香港', '澳门'];
    // 全国省份数据
    var toolTipData = [{
        "provinceName": "北京",
        "provinceKey": 110000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 58,
        "totalPrice": 860448.7,
        "orderCount": 31744,
        "onlineCount": 0
    }, {
        "provinceName": "天津",
        "provinceKey": 120000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 74,
        "totalPrice": 697438.3,
        "orderCount": 30025,
        "onlineCount": 0
    }, {
        "provinceName": "河北",
        "provinceKey": 130000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 175,
        "totalPrice": 1051461.5,
        "orderCount": 50625,
        "onlineCount": 0
    }, {
        "provinceName": "山西",
        "provinceKey": 140000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 73,
        "totalPrice": 432680.2,
        "orderCount": 20427,
        "onlineCount": 0
    }, {
        "provinceName": "内蒙古",
        "provinceKey": 150000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 46,
        "totalPrice": 379952.5,
        "orderCount": 14585,
        "onlineCount": 0
    }, {
        "provinceName": "辽宁",
        "provinceKey": 210000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 74,
        "totalPrice": 543290.6,
        "orderCount": 27143,
        "onlineCount": 0
    }, {
        "provinceName": "吉林",
        "provinceKey": 220000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 25,
        "totalPrice": 234353.7,
        "orderCount": 11123,
        "onlineCount": 0
    }, {
        "provinceName": "黑龙江",
        "provinceKey": 230000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 25,
        "totalPrice": 152894.8,
        "orderCount": 6481,
        "onlineCount": 0
    }, {
        "provinceName": "上海",
        "provinceKey": 310000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 78,
        "totalPrice": 665877.5,
        "orderCount": 26753,
        "onlineCount": 0
    }, {
        "provinceName": "江苏",
        "provinceKey": 320000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 475,
        "totalPrice": 3302139.4,
        "orderCount": 158180,
        "onlineCount": 0
    }, {
        "provinceName": "浙江",
        "provinceKey": 330000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 332,
        "totalPrice": 2285259.3,
        "orderCount": 116344,
        "onlineCount": 0
    }, {
        "provinceName": "安徽",
        "provinceKey": 340000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 168,
        "totalPrice": 1081322.1,
        "orderCount": 57139,
        "onlineCount": 0
    }, {
        "provinceName": "福建",
        "provinceKey": 350000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 145,
        "totalPrice": 1352019.8,
        "orderCount": 65228,
        "onlineCount": 0
    }, {
        "provinceName": "江西",
        "provinceKey": 360000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 103,
        "totalPrice": 689353.7,
        "orderCount": 31822,
        "onlineCount": 0
    }, {
        "provinceName": "山东",
        "provinceKey": 370000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 198,
        "totalPrice": 1177320.9,
        "orderCount": 59966,
        "onlineCount": 0
    }, {
        "provinceName": "河南",
        "provinceKey": 410000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 184,
        "totalPrice": 953710.6,
        "orderCount": 52829,
        "onlineCount": 0
    }, {
        "provinceName": "湖北",
        "provinceKey": 420000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 125,
        "totalPrice": 890921.4,
        "orderCount": 46768,
        "onlineCount": 0
    }, {
        "provinceName": "湖南",
        "provinceKey": 430000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 111,
        "totalPrice": 1007182.7,
        "orderCount": 44094,
        "onlineCount": 0
    }, {
        "provinceName": "广东",
        "provinceKey": 440000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 384,
        "totalPrice": 3792306.1,
        "orderCount": 165774,
        "onlineCount": 0
    }, {
        "provinceName": "广西",
        "provinceKey": 450000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 194,
        "totalPrice": 1252955,
        "orderCount": 69882,
        "onlineCount": 0
    }, {
        "provinceName": "海南",
        "provinceKey": 460000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 58,
        "totalPrice": 617514,
        "orderCount": 33090,
        "onlineCount": 0
    }, {
        "provinceName": "重庆",
        "provinceKey": 500000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 35,
        "totalPrice": 468892.6,
        "orderCount": 20163,
        "onlineCount": 0
    }, {
        "provinceName": "四川",
        "provinceKey": 510000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 127,
        "totalPrice": 793622.7,
        "orderCount": 43625,
        "onlineCount": 0
    }, {
        "provinceName": "贵州",
        "provinceKey": 520000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 78,
        "totalPrice": 659747.2,
        "orderCount": 28817,
        "onlineCount": 0
    }, {
        "provinceName": "云南",
        "provinceKey": 530000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 87,
        "totalPrice": 657485.2,
        "orderCount": 30916,
        "onlineCount": 0
    }, {
        "provinceName": "西藏",
        "provinceKey": 540000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 5,
        "totalPrice": 106922.4,
        "orderCount": 2470,
        "onlineCount": 0
    }, {
        "provinceName": "陕西",
        "provinceKey": 610000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 65,
        "totalPrice": 589961.2,
        "orderCount": 27093,
        "onlineCount": 0
    }, {
        "provinceName": "甘肃",
        "provinceKey": 620000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 40,
        "totalPrice": 248209.2,
        "orderCount": 12390,
        "onlineCount": 0
    }, {
        "provinceName": "青海",
        "provinceKey": 630000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 3,
        "totalPrice": 33328.1,
        "orderCount": 1161,
        "onlineCount": 0
    }, {
        "provinceName": "宁夏",
        "provinceKey": 640000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 14,
        "totalPrice": 146590.7,
        "orderCount": 5240,
        "onlineCount": 0
    }, {
        "provinceName": "新疆",
        "provinceKey": 650000,
        "cityName": null,
        "cityKey": null,
        "shopCount": 43,
        "totalPrice": 294423.4,
        "orderCount": 11741,
        "onlineCount": 0
    }]
    var seriesData = [];
    for (var i = 0; i < toolTipData.length; i++) {
        seriesData[i] = {};
        seriesData[i].name = toolTipData[i].provinceName;
        seriesData[i].value = toolTipData[i].shopCount;
        seriesData[i].provinceKey = toolTipData[i].provinceKey;
    }
    // 请求省市数据，传递provinceKey进行ajax请求 province(key)
    var provinceData = [{
        "provinceName": null,
        "provinceKey": null,
        "cityName": "乌鲁木齐市",
        "cityKey": 650100,
        "shopCount": 17,
        "totalPrice": 89429.1,
        "orderCount": 4019,
        "onlineCount": 0
    }, {
        "provinceName": null,
        "provinceKey": null,
        "cityName": "克拉玛依市",
        "cityKey": 650200,
        "shopCount": 1,
        "totalPrice": 363.6,
        "orderCount": 17,
        "onlineCount": 0
    }, {
        "provinceName": null,
        "provinceKey": null,
        "cityName": "昌吉回族自治州",
        "cityKey": 652300,
        "shopCount": 3,
        "totalPrice": 2203.7,
        "orderCount": 82,
        "onlineCount": 0
    }, {
        "provinceName": null,
        "provinceKey": null,
        "cityName": "博尔塔拉蒙古自治州",
        "cityKey": 652700,
        "shopCount": 1,
        "totalPrice": 7327.7,
        "orderCount": 236,
        "onlineCount": 0
    }, {
        "provinceName": null,
        "provinceKey": null,
        "cityName": "巴音郭楞蒙古自治州",
        "cityKey": 652800,
        "shopCount": 2,
        "totalPrice": 28768.4,
        "orderCount": 961,
        "onlineCount": 0
    }, {
        "provinceName": null,
        "provinceKey": null,
        "cityName": "阿克苏地区",
        "cityKey": 652900,
        "shopCount": 5,
        "totalPrice": 78415.2,
        "orderCount": 3108,
        "onlineCount": 0
    }, {
        "provinceName": null,
        "provinceKey": null,
        "cityName": "喀什地区",
        "cityKey": 653100,
        "shopCount": 4,
        "totalPrice": 38870.1,
        "orderCount": 1477,
        "onlineCount": 0
    }, {
        "provinceName": null,
        "provinceKey": null,
        "cityName": "和田地区",
        "cityKey": 653200,
        "shopCount": 1,
        "totalPrice": 10488,
        "orderCount": 218,
        "onlineCount": 0
    }, {
        "provinceName": null,
        "provinceKey": null,
        "cityName": "伊犁哈萨克自治州",
        "cityKey": 654000,
        "shopCount": 6,
        "totalPrice": 32864.2,
        "orderCount": 1363,
        "onlineCount": 0
    }, {
        "provinceName": null,
        "provinceKey": null,
        "cityName": "塔城地区",
        "cityKey": 654200,
        "shopCount": 1,
        "totalPrice": 160,
        "orderCount": 5,
        "onlineCount": 0
    }, {
        "provinceName": null,
        "provinceKey": null,
        "cityName": "省直辖行政单位",
        "cityKey": 659000,
        "shopCount": 2,
        "totalPrice": 5533.4,
        "orderCount": 255,
        "onlineCount": 0
    }];
    var seriesDataPro = [];
    for (var i = 0; i < provinceData.length; i++) {
        seriesDataPro[i] = {};
        seriesDataPro[i].name = provinceData[i].cityName;
        seriesDataPro[i].value = provinceData[i].shopCount;
    }

    var max = Math.max.apply(Math, seriesData.map(function (o) {
        return o.value
    })),
        min = 0; // 侧边最大值最小值
    var maxSize4Pin = 40,
        minSize4Pin = 30;
    // 点击返回按钮
    oBack.onclick = function () {
        $('#back').addClass('hidden');
        mapName = '';
        initEcharts("china", "中国");
    };

    var mapName = '';

    function getGeoCoordMap(name) {
        name = name ? name : 'china';
        /*获取地图数据*/
        var geoCoordMap = {};
        myChart.showLoading(); // loading start
        var mapFeatures = echarts.getMap(name).geoJson.features;
        myChart.hideLoading(); // loading end
        mapFeatures.forEach(function (v) {
            var name = v.properties.name; // 地区名称
            geoCoordMap[name] = v.properties.cp; // 地区经纬度
        });
        return geoCoordMap;
    }

    function convertData(data) { // 转换数据
        var geoCoordMap = getGeoCoordMap(mapName);
        var res = [];
        for (var i = 0; i < data.length; i++) {
            var geoCoord = geoCoordMap[data[i].name]; // 数据的名字对应的经纬度
            if (geoCoord) { // 如果数据data对应上，
                res.push({
                    name: data[i].name,
                    value: geoCoord.concat(data[i].value),
                });
            }
        }
        return res;
    };
    // 初始化echarts-map
    initEcharts("china", "中国");

    function initEcharts(pName, Chinese_) {
        var tmpSeriesData = pName === "china" ? seriesData : seriesDataPro;
        var tmp = pName === "china" ? toolTipData : provinceData;
        var option = {
            title: {
                text: Chinese_ || pName,
                left: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: function (params) { // 鼠标滑过显示的数据
                    if (pName === "china") {
                        var toolTiphtml = ''
                        for (var i = 0; i < tmp.length; i++) {
                            if (params.name == tmp[i].provinceName) {
                                toolTiphtml += tmp[i].provinceName + '<br>销售额：' + unitConvert(tmp[i].totalPrice) + '<br>订单数：' + tmp[i].orderCount + '单' + '<br>门店数：' + tmp[i].shopCount;
                            }
                        }
                        return toolTiphtml;
                    } else {
                        var toolTiphtml = ''
                        for (var i = 0; i < tmp.length; i++) {
                            if (params.name == tmp[i].cityName) {
                                toolTiphtml += tmp[i].cityName + '<br>销售额：' + unitConvert(tmp[i].totalPrice) + '<br>订单数：' + tmp[i].orderCount + '单' + '<br>门店数：' + tmp[i].shopCount;
                            }
                        }
                        return toolTiphtml;
                    }
                }
            },
            visualMap: { //视觉映射组件
                show: true,
                min: min,
                max: max, // 侧边滑动的最大值，从数据中获取
                left: '5%',
                top: '96%',
                inverse: true, //是否反转 visualMap 组件
                // itemHeight:200,  //图形的高度，即长条的高度
                text: ['高', '低'], // 文本，默认为数值文本
                calculable: false, //是否显示拖拽用的手柄（手柄能拖拽调整选中范围）
                seriesIndex: 1, //指定取哪个系列的数据，即哪个系列的 series.data,默认取所有系列
                orient: "horizontal",
                inRange: {
                    color: ['#dbfefe', '#1066d5'] // 蓝绿
                }
            },
            geo: {
                show: true,
                map: pName,
                roam: false,
                label: {
                    normal: {
                        show: false
                    },
                    emphasis: {
                        show: false,
                    }
                },
                itemStyle: {
                    normal: {
                        areaColor: '#3c8dbc', // 没有值得时候颜色
                        borderColor: '#097bba',
                    },
                    emphasis: {
                        areaColor: '#fbd456', // 鼠标滑过选中的颜色
                    }
                }
            },
            series: [{
                name: '散点',
                type: 'scatter',
                coordinateSystem: 'geo',
                data: tmpSeriesData,
                symbolSize: '1',
                label: {
                    normal: {
                        show: true,
                        formatter: '{b}',
                        position: 'right'
                    },
                    emphasis: {
                        show: true
                    }
                },
                itemStyle: {
                    normal: {
                        color: '#895139' // 字体颜色
                    }
                }
            },
            {
                name: Chinese_ || pName,
                type: 'map',
                mapType: pName,
                roam: false, //是否开启鼠标缩放和平移漫游
                data: tmpSeriesData,
                // top: "3%",//组件距离容器的距离
                // geoIndex: 0,
                // aspectScale: 0.75,       //长宽比
                // showLegendSymbol: false, // 存在legend时显示
                selectedMode: 'single',
                label: {
                    normal: {
                        show: true, //显示省份标签
                        textStyle: {
                            color: "#895139"
                        } //省份标签字体颜色
                    },
                    emphasis: { //对应的鼠标悬浮效果
                        show: true,
                        textStyle: {
                            color: "#323232"
                        }
                    }
                },
                itemStyle: {
                    normal: {
                        borderWidth: .5, //区域边框宽度
                        borderColor: '#0550c3', //区域边框颜色
                        areaColor: "#0b7e9e", //区域颜色
                    },
                    emphasis: {
                        borderWidth: .5,
                        borderColor: '#4b0082',
                        areaColor: "#ece39e",
                    }
                }
            },
            {
                name: '点',
                type: 'scatter',
                coordinateSystem: 'geo',
                symbol: 'pin', //气泡
                symbolSize: function (val) {
                    var a = (maxSize4Pin - minSize4Pin) / (max - min);
                    var b = minSize4Pin - a * min;
                    b = maxSize4Pin - a * max;
                    return a * val[2] + b;
                },
                label: {
                    normal: {
                        show: true,
                        formatter: function (params) {
                            return params.data.value[2];
                        },
                        textStyle: {
                            color: '#fff',
                            fontSize: 9
                        }
                    }
                },
                itemStyle: {
                    normal: {
                        color: 'red' //标志颜色'#F62157'
                    }
                },
                zlevel: 6,
                data: convertData(tmpSeriesData),
            },
            ]
        };
        // 针对海南放大
        if (pName == '海南') {
            option.series[1].center = [109.844902, 19.0392];
            option.series[1].layoutCenter = ['50%', '50%'];
            option.series[1].layoutSize = "300%";
        } else { //非显示海南时，将设置的参数恢复默认值
            option.series[1].center = undefined;
            option.series[1].layoutCenter = undefined;
            option.series[1].layoutSize = undefined;
        }
        myChart.setOption(option);
        /* 响应式 */
        $(window).resize(function () {
            myChart.resize();
        });

        myChart.off("click");

        if (pName === "china") { // 全国时，添加click 进入省级
            myChart.on('click', function (param) {
                // console.log(param.name);
                if (param.data && param.data.provinceKey) {
                    var key = param.data.provinceKey;
                    // province(key);  省份请求
                    if (provinceData.length) {
                        $('#back').removeClass('hidden');
                        // 遍历取到provincesText 中的下标  去拿到对应的省js
                        for (var i = 0; i < provincesText.length; i++) {
                            if (param.name === provincesText[i]) {
                                mapName = provincesText[i];
                                //显示对应省份的方法
                                showProvince(provinces[i], provincesText[i]);
                                break;
                            }
                        }
                    }
                }
            });
        } else { // 省份，添加双击 回退到全国
            myChart.on("dblclick", function () {
                $('#back').addClass('hidden');
                mapName = '';
                initEcharts("china", "中国");
            });
        }
    }

    // 展示对应的省
    function showProvince(pName, Chinese_) {
        //这写省份的js都是通过在线构建工具生成的，保存在本地，需要时加载使用即可，最好不要一开始全部直接引入。
        loadBdScript('$' + pName + 'JS', './static/js/map/province/' + pName + '.js', function () {
            initEcharts(Chinese_);
        });
    }

    // 加载对应的JS
    function loadBdScript(scriptId, url, callback) {
        var script = document.createElement("script");
        script.type = "text/javascript";
        if (script.readyState) { //IE
            script.onreadystatechange = function () {
                if (script.readyState === "loaded" || script.readyState === "complete") {
                    script.onreadystatechange = null;
                    callback();
                }
            };
        } else { // Others
            script.onload = function () {
                callback();
            };
        }
        script.src = url;
        script.id = scriptId;
        document.getElementsByTagName("head")[0].appendChild(script);
    };
</script>












<!--青岛研锦网络科技有限公司   版权所有-->
<!-- <script src="scripts/jquery-2.2.1.min.js"></script>
<script src="scripts/bootstrap.min.js"></script>
<script src="scripts/common.js"></script>
<script src="scripts/echarts.min.js"></script>
<script src="scripts/datatool.js"></script>
<script src="scripts/index.js"></script>
<script src="scripts/china.js"></script>
<script src="scripts/guangxi.js"></script> -->


<!-- <script type="text/javascript">
    var dianshang = [];
    function get_shuju() {
        $.ajax({
            type: "post",
            async: false,
            url: "/record/dianshang",
            data: {},
            dataType: "json",
            success: function (res) {
               
                dianshang.push(res);
              
            }
        })
        return dianshang;
    }

   
   
   

    dianshang = get_shuju();

    var changedetail = echarts.init(document.getElementById('chart_4'));
    option = {
        tooltip: {
            trigger: 'axis',
           
        },
        toolbox: {
            show: false,
            feature: {
                dataView: { show: true, readOnly: false },
                magicType: { show: true, type: ['line', 'bar'] },
                restore: { show: true },
                saveAsImage: { show: true }
            }
        },
        legend: {
            data: ['', ''],
            show: false
        },
        grid: {
            top: '18%',
            right: '5%',
            bottom: '8%',
            left: '5%',
            containLabel: true
        },
        xAxis: [
            {
                type: 'category',
                data: ['名优企业', '技术服务', '技术开发', '电子商务', '网络推广', '涉互联网企业'],
                splitLine: {
                    show: false,
                    lineStyle: {
                        color: '#3c4452'
                    }
                },
                axisTick: {
                    show: false
                },
                axisLabel: {
                    textStyle: {
                        color: "#fff"
                    },
                    lineStyle: {
                        color: '#519cff'
                    },
                    alignWithLabel: true,
                    interval: 0
                }
            }
        ],
        yAxis: [
            {
                type: 'value',
                name: '入驻数据',
                nameTextStyle: {
                    color: '#fff'
                },
                interval: 100000,
                min: 0,
                splitLine: {
                    show: true,
                    lineStyle: {
                        color: '#23303f'
                    }
                },
                axisLine: {
                    show: false,
                    lineStyle: {
                        color: '#115372'
                    }
                },
                axisTick: {
                    show: false
                },
                axisLabel: {
                    textStyle: {
                        color: "#fff"
                    },
                    alignWithLabel: true,
                    interval: 0

                }
            }
        ],
        color: "yellow",
        series: [
            {
                name: '电商企业入驻',
                type: 'bar',
                data: [dianshang[0][0], dianshang[0][1], dianshang[0][2], dianshang[0][3], dianshang[0][4], dianshang[0][5]],
                boundaryGap: '45%',
                barWidth: '40%',

                itemStyle: {
                    normal: {
                        color: function (params) {
                            var colorList = [
                                '#6bc0fb', '#7fec9d', '#fedd8b', '#ffa597', '#84e4dd', '#6bc0fb'
                            ];
                            return colorList[params.dataIndex]
                        }, label: {
                            show: true,
                            position: 'top',
                            formatter: '{c}'
                        }
                    }
                }
            }
        ]
    };
    changedetail.setOption(option);
</script> -->

</html>
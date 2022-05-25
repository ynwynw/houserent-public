<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-lg-3 col-md-4 col-sm-12" style="min-height: 850px;">
    <div class="property_dashboard_navbar" style="background-color: #1B2132;">
        <div class="dash_user_menues">
            <ul>
                <c:if test="${sessionScope.user.role =='admin'}">
                    <strong><h4 style="text-align: center;color: white;">管理员后台管理</h4></strong>
                </c:if>
                <c:if test="${sessionScope.user.role =='owner'}">
                    <strong><h4 style="text-align: center;color: white;">房东后台管理</h4></strong>
                </c:if>
                <c:if test="${sessionScope.user.role =='customer'}">
                    <strong><h4 style="text-align: center;color: white;">用户后台管理</h4></strong>
                </c:if>

                <c:if test="${sessionScope.user.role == 'admin'}">
                    <li <c:if test="${tab == 'admin-control'}"> class="active"</c:if>>
                        <a href="/admin/control" style="color: white">
                            <i class="ti-align-center"></i>&nbsp后台管理
                        </a>
                    </li>
                </c:if>
                <li <c:if test="${tab == 'my-profile'}"> class="active"</c:if>>
                    <a href="/admin/profile" style="color: white">
                        <i class="ti-user"></i>&nbsp个人信息
                    </a>
                </li>
                <li <c:if test="${tab == 'home'}"> class="active"</c:if>>
                    <a href="/admin/home" style="color: white">
                        <i class="ti-user"></i>&nbsp我的家
                    </a>
                </li>
                <c:if test="${sessionScope.user.role == 'admin' || sessionScope.user.role == 'owner'}">
                    <li <c:if test="${tab == 'house-list'}"> class="active"</c:if>>
                        <a href="/admin/house" style="color: white">
                            <i class="ti-layers"></i>&nbsp房屋管理
                        </a>
                    </li>
                </c:if>
                <li <c:if test="${tab == 'order-list'}"> class="active"</c:if>>
                    <a href="/admin/order" style="color: white">
                        <i class="ti-gift"></i>&nbsp订单管理
                    </a>
                </li>
                <li <c:if test="${tab == 'payment'}"> class="active"</c:if>>
                    <a href="/admin/charge" style="color: white">
                        <i class="ti-money"></i>&nbsp充值中心
                    </a>
                </li>
                <li <c:if test="${tab == 'mark-list'}"> class="active"</c:if>>
                    <a href="/admin/mark" style="color: white">
                        <i class="ti-bookmark"></i>&nbsp我的收藏
                    </a>
                </li>
                <c:if test="${sessionScope.user.role == 'admin'}">
                    <li <c:if test="${tab == 'news-list'}"> class="active"</c:if>>
                        <a href="/admin/news" style="color: white">
                            <i class="ti-new-window"></i>&nbsp新闻资讯
                        </a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.user.role == 'admin'}">
                    <li <c:if test="${tab == 'feedback-list'}"> class="active"</c:if>>
                        <a href="/admin/feedback" style="color: white">
                            <i class="ti-alert"></i>&nbsp反馈管理
                        </a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.user.role != 'admin'}">
                    <li <c:if test="${tab == 'feedback-list'}"> class="active"</c:if>>
                        <a href="/admin/feedback" style="color: white">
                            <i class="ti-alert"></i>&nbsp我的反馈
                        </a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.user.role == 'admin'}">
                    <li <c:if test="${tab == 'user-list'}"> class="active"</c:if>>
                        <a href="/admin/user" style="color: white">
                            <i class="ti-user"></i>&nbsp用户管理
                        </a>
                    </li>
                </c:if>
                <li <c:if test="${tab == 'password'}"> class="active"</c:if>>
                    <a href="/admin/password" style="color: white">
                        <i class="ti-unlock"></i>&nbsp密码修改
                    </a>
                </li>
                <li>
                    <a href="/login/logout">
                        <i class="ti-power-off"></i>&nbsp退出登录
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
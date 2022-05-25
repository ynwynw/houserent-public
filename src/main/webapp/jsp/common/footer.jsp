<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<footer class="dark-footer skin-dark-footer style-2" style="padding-top: 0;">--%>
<%--    <style>--%>
<%--        .footer-bottom a {--%>
<%--            color: white;--%>
<%--            text-decoration: none;--%>
<%--            font-weight: bold;--%>
<%--            font-family: 'Shift', sans-serif;--%>
<%--        }--%>
<%--    </style>--%>
<%--    <div class="footer-bottom">--%>
<%--        <div class="container">--%>
<%--            <div class="row">--%>
<%--                <div class="col-12">--%>

<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="row">--%>
<%--                <div class="col-md-3">--%>
<%--                    <img src="/assets/img/logo/ihouse.png" width="200px;" height="50px;"><br>--%>
<%--                    <p style="font-family: 'Shift', sans-serif;">--%>
<%--                        爱租房（iRental）是一家联系旅游人士和家有空房出租的房主的服务型网站，它可以为用户提供多样的住宿信息。iRental是一个旅行房屋租赁社区，用户可通过网络或手机应用程序发布、搜索度假房屋租赁信息并完成在线预定程序。</p>--%>
<%--                </div>--%>
<%--                <div class="col-md-3">--%>
<%--                    <h4 style="font-family: 'Shift', sans-serif;font-size: 18px;font-weight: bold;">爱租房</h4>--%>
<%--                    <a>工作机会</a><br>--%>
<%--                    <a href="/news">新闻</a><br>--%>
<%--                    <a>政策</a><br>--%>
<%--                </div>--%>
<%--                <div class="col-md-3">--%>
<%--                    <h4 style="font-family: 'Shift', sans-serif;font-size: 18px;font-weight: bold;">出租</h4>--%>
<%--                    <a href="/news/detail/9">为什么要出租？</a><br>--%>
<%--                    <a href="/news/detail/10">待客之道</a><br>--%>
<%--                    <a>房东义务</a><br>--%>
<%--                </div>--%>
<%--                <div class="col-md-3">--%>
<%--                    <h4 style="font-family: 'Shift', sans-serif;font-size: 18px;font-weight: bold;">客服支持</h4>--%>
<%--                    <a href="/feedback">帮助</a><br>--%>
<%--                    <a href="/feedback">反馈</a><br>--%>
<%--                    <a href="/feedback">联系我们</a><br>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <br>--%>
<%--            <div class="row">--%>
<%--                <div class="col-12">--%>
<%--                    <p class="mb-0" style="color: white;font-family: 'Shift', sans-serif;text-align: center;">©2021 爱租房--%>
<%--                        版权所有 All Rights Reserved.</p>--%>

<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</footer>--%>
<style>
    .ftco-bg-dark {
        background: #3c312e;
    }

    .ftco-footer {
        font-size: 16px;
        padding: 7em 0;
        background: #232323;
    }

    .ftco-section {
        position: relative;
        width: 100%;
        display: block;
    }

    .ftco-footer .ftco-footer-widget h2 {
        font-weight: normal;
        color: #fff;
        margin-bottom: 40px;
        font-size: 18px;
        font-weight: 700;
        font-family: "Poppins", Arial, sans-serif;
    }

    .ftco-footer .ftco-footer-widget ul li a span {
        color: #fff;
    }

    .ftco-footer p {
        color: rgba(255, 255, 255, 0.7);
    }

    .ftco-footer a {
        color: rgba(255, 255, 255, 0.7);
    }

    .ftco-footer a:hover {
        color: #fff;
    }

    .ftco-footer .ftco-heading-2 {
        font-size: 17px;
        font-weight: 400;
        color: #000000;
    }

    .ftco-footer-social li {
        list-style: none;
        margin: 0 10px 0 0;
        display: inline-block;
    }

    .ftco-footer-social li a {
        height: 50px;
        width: 50px;
        display: block;
        float: left;
        background: rgba(255, 255, 255, 0.05);
        border-radius: 50%;
        position: relative;
    }

    .ftco-footer-social li a span {
        position: absolute;
        font-size: 26px;
        top: 50%;
        left: 50%;
        -webkit-transform: translate(-50%, -50%);
        -ms-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
    }

    .ftco-footer-social li a:hover {
        color: #fff;
    }

    .list-unstyled {
        padding-left: 0;
        list-style: none;
    }

    .ftco-footer .ftco-footer-widget h2 {
        font-weight: normal;
        color: #fff;
        margin-bottom: 40px;
        font-size: 18px;
        font-weight: 700;
        font-family: "Poppins", Arial, sans-serif;
    }

    .ftco-footer .ftco-footer-widget ul li a span {
        color: #fff;
    }

    .ftco-footer .ftco-footer-widget .btn-primary {
        background: #fff !important;
        border: 2px solid #fff !important;
    }

    .ftco-footer .ftco-footer-widget .btn-primary:hover {
        background: #fff;
        border: 2px solid #fff !important;
    }

</style>

<footer class="ftco-footer ftco-bg-dark ftco-section">
    <div class="container">
        <div class="row mb-5">
            <div class="col-md">
                <div class="ftco-footer-widget mb-4">
                    <h2 class="ftco-heading-2">爱租房</h2>
                    <p>
                        iRental
                        是一家联系旅游人士和家有空房出租的房主的服务型网站，它可以为用户提供多样的住宿信息。iRental是一个旅行房屋租赁社区，用户可通过网络或手机应用程序发布、搜索度假房屋租赁信息并完成在线预定程序。</p>
                </div>
            </div>
            <div class="col-md">
                <div class="ftco-footer-widget mb-4 ml-md-5">
                    <h2 class="ftco-heading-2">链接</h2>
                    <ul class="list-unstyled">
                        <li><a href="#" class="py-2 d-block">工作机会</a></li>
                        <li><a href="/news" class="py-2 d-block">新闻</a></li>
                        <li><a href="/policy" class="py-2 d-block">政策</a></li>
                        <li><a href="/house" class="py-2 d-block">房间</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md">
                <div class="ftco-footer-widget mb-4">
                    <h2 class="ftco-heading-2">出租</h2>
                    <ul class="list-unstyled">
                        <li><a href="/news/detail/9" class="py-2 d-block">为什么要出租？</a></li>
                        <li><a href="/news/detail/10" class="py-2 d-block">待客之道</a></li>
                        <li><a href="#" class="py-2 d-block">房东义务</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md">
                <div class="ftco-footer-widget mb-4">
                    <h2 class="ftco-heading-2">客服支持</h2>
                    <ul class="list-unstyled">
                        <li><a href="/feedback" class="py-2 d-block">帮助</a></li>
                        <li><a href="/feedback" class="py-2 d-block">反馈</a></li>
                        <li><a href="/feedback" class="py-2 d-block">联系我们</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 text-center">
                <p>Copyright © 2022. 爱租房 iRental All rights reserved.</p>
            </div>
        </div>
    </div>
</footer>

</body>
</html>
<%--注册--%>
<div class="modal" id="signup">
    <div class="modal-dialog">
        <header>
            <div class="hm_nav">
                <h3 class="hm_nav_title">注册</h3>
                <span class="mod-close" data-dismiss="modal"><i class="ti-close"></i></span>
            </div>
        </header>
        <div class="modal-content" id="sign-up">
            <div class="modal-body">
                <form id="registerForm">
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="form-group">
                                <label>姓名</label>
                                <div class="input-with-icon">
                                    <input type="text" name="userDisplayName" class="form-control" placeholder="姓名">
                                    <i class="ti-user"></i>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>电子邮箱</label>
                                <div class="input-with-icon">
                                    <input type="email" name="email" class="form-control" placeholder="电子邮箱，用于找回密码">
                                    <i class="ti-user"></i>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>手机号</label>
                                <div class="input-with-icon">
                                    <input type="text" name="phone" class="form-control" placeholder="手机号">
                                    <i class="ti-mobile"></i>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>账号</label>
                                <div class="input-with-icon">
                                    <input type="text" name="userName" class="form-control" placeholder="登录账号">
                                    <i class="ti-user"></i>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>密码</label>
                                <div class="input-with-icon">
                                    <input type="password" name="userPass" class="form-control" placeholder="登录密码">
                                    <i class="ti-unlock"></i>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>角色</label>
                                <div class="input-with-icon">
                                    <div class="simple">
                                        <select name="role" class="form-control">
                                            <option value="customer">我是租客</option>
                                            <option value="owner">我是房东</option>
                                        </select>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <button type="button" onclick="submitRegister()" class="btn btn-md full-width pop-login bg-2">
                            立即注册
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>


<%--登录--%>
<div class="modal" id="login">
    <div class="modal-dialog">
        <header>
            <div class="hm_nav">
                <h3 class="hm_nav_title">登录</h3>
                <span class="mod-close" data-dismiss="modal"><i class="ti-close"></i></span>
            </div>
        </header>
        <div class="modal-content">
            <div class="modal-body">
                <form id="loginForm">
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="form-group">
                                <label>账号</label>
                                <div class="input-with-icon">
                                    <input type="text" name="userName" class="form-control" placeholder="请输入账号">
                                    <i class="ti-user"></i>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>密码</label>
                                <div class="input-with-icon">
                                    <input type="password" name="userPass" class="form-control" placeholder="请输入密码">
                                    <i class="ti-unlock"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <button type="button" onclick="submitLogin()" class="btn btn-md full-width pop-login bg-2">
                            立即登录
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/head.jsp" %>
<link rel="stylesheet" href="/assets/admin-control/css/ready.css">
<link rel="stylesheet" href="/assets/admin-control/css/demo.css">
<section class="p-0">
    <div class="container-fluid p-0">
        <div class="row">
            <%@ include file="../common/admin-left.jsp" %>
            <div class="col-lg-9 col-md-8 col-sm-12">
                <div class="content">
                    <div class="container-fluid">
                        <h3>欢迎回来，${user.userDisplayName}。</h3><br>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="card card-stats card-warning">
                                    <div class="card-body ">
                                        <div class="row">
                                            <div class="col-5">
                                                <div class="icon-big text-center">
                                                    <i class="la la-users"></i>
                                                </div>
                                            </div>
                                            <div class="col-7 d-flex align-items-center">
                                                <div class="numbers">
                                                    <p class="card-category">用户总人数</p>
                                                    <h4 class="card-title">${userCount}</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card card-stats card-success">
                                    <div class="card-body ">
                                        <div class="row">
                                            <div class="col-5">
                                                <div class="icon-big text-center">
                                                    <i class="la la-bar-chart"></i>
                                                </div>
                                            </div>
                                            <div class="col-7 d-flex align-items-center">
                                                <div class="numbers">
                                                    <p class="card-category">上线房屋数</p>
                                                    <h4 class="card-title">${houseCount}</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card card-stats card-danger">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-5">
                                                <div class="icon-big text-center">
                                                    <i class="la la-newspaper-o"></i>
                                                </div>
                                            </div>
                                            <div class="col-7 d-flex align-items-center">
                                                <div class="numbers">
                                                    <p class="card-category">用户反馈</p>
                                                    <h4 class="card-title">${userFeedbackCount}</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card card-stats card-primary">
                                    <div class="card-body ">
                                        <div class="row">
                                            <div class="col-5">
                                                <div class="icon-big text-center">
                                                    <i class="la la-check-circle"></i>
                                                </div>
                                            </div>
                                            <div class="col-7 d-flex align-items-center">
                                                <div class="numbers">
                                                    <p class="card-category">订单总量</p>
                                                    <h4 class="card-title">${orderNum}</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row row-card-no-pd">
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-body">
                                        <p class="fw-bold mt-1">账户余额</p>
                                        <h4><b>￥ ${sessionScope.user.balance}</b></h4>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">最新订单信息</h4>
                                        <p class="card-category">
                                            最新N条订单交易信息</p>
                                    </div>
                                    <div class="card-body">
                                        <div id="salesChart" class="chart"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">用户反馈</h4>
                                        <p class="card-category">
                                            最近 3 条用户反馈信息 待处理</p>
                                    </div>
                                    <div class="card-body">
                                        <div id="monthlyChart" class="chart chart-pie">
                                            <tbody>
                                            <c:forEach items="${pageInfo.records}" var="c">
                                                <tr>
                                                    <td class="dashboard_propert_wrapper">
                                                        <div class="title">
                                                            <h5>${c.title}</h5>
                                                            <p>
                                                                <c:choose>
                                                                <c:when test="${c.status == 0}">
                                                                <span class="text-warning">待处理</span>
                                                            <p>反馈内容：${c.content}</p>
                                                            </c:when>
                                                            </c:choose>
                                                                ${c.contactName} ${c.contactEmail}
                                                            </p>

                                                        </div>
                                                    </td>
                                                </tr>

                                            </c:forEach>
                                            </tbody>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">新闻资讯</h4>
                                        <p class="card-category">
                                            站点最新发布的新闻资讯 3 条</p>
                                    </div>
                                    <div class="card-body">
                                        <div id="news" class="chart chart-pie">
                                            <table class="property-table-wrap responsive-table bkmark">

                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</section>


<script src="/assets/admin-control/js/ready.min.js"></script>
<script src="/assets/admin-control/js/demo.js"></script>
<%@ include file="../common/footer.jsp" %>

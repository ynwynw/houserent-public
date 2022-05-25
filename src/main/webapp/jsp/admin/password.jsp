<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/head.jsp" %>
<section class="p-0">
    <div class="container-fluid p-0">
        <div class="row">
            <%@ include file="../common/admin-left.jsp" %>
            <div class="col-lg-9 col-md-8 col-sm-12">
                <div class="col-lg-9 col-md-8 col-sm-12">
                    <div style="margin-bottom: 70px;" class="dashboard-wraper">
                        <section style="padding-top: 10px;">
                            <div class="container">
                                <div class="row">
                                    <form id="passwordForm">
                                        <div class="col-lg-6 col-md-6">
                                            <div class="submit-page form-simple">
                                                <div class="frm_submit_block">
                                                    <h3>修改密码</h3>
                                                    <p><i class="ti-alert"></i> 您即将修改登录密码。</p>
                                                    <p>用户名：${sessionScope.user.userDisplayName}</p>
                                                    <div class="form-row">
                                                        <div class="form-group col-md-12">
                                                            <label>原密码</label>
                                                            <input type="password" name="oldPassword"
                                                                   class="form-control">
                                                        </div>
                                                        <div class="form-group col-md-12">
                                                            <label>新密码</label>
                                                            <input type="password" name="newPassword"
                                                                   class="form-control">
                                                        </div>
                                                        <div class="form-group col-md-12">
                                                            <label>确认密码</label>
                                                            <input type="password" name="confirmPassword"
                                                                   class="form-control">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-lg-12 col-md-12">
                                                        <button class="btn btn-theme bg-2" type="button"
                                                                onclick="submitPassword()">更新密码
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%@ include file="../common/footer.jsp" %>

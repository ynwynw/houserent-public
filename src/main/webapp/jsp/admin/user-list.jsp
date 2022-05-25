<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/head.jsp" %>
<section class="p-0">
    <div class="container-fluid p-0">
        <div class="row">
            <%@ include file="../common/admin-left.jsp" %>
            <div class="col-lg-9 col-md-8 col-sm-12">
                <div class="dashboard-body">
                    <div class="dashboard-wraper">
                        <div class="frm_submit_block">
                            <h4>用户管理</h4>
                        </div>
                        <table class="property-table-wrap responsive-table bkmark">
                            <tbody>
                            <tr>
                                <th>账号信息</th>
                                <th>联系方式</th>
                                <th>其他信息</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                            <c:forEach items="${pageInfo.records}" var="c">
                                <tr>
                                    <td><img src="${c.userAvatar}" class="avatar-70">
                                        <span>
                                        UID:${c.id} 用户名:${c.userName} 姓名:${c.userDisplayName}</span>
                                        <span>证件号:${c.idCard}</span>
                                    </td>
                                    <td>
                                        <span>邮箱：${c.email}</span><br>
                                        <span>手机号：${c.phone}</span>
                                    </td>
                                    <td>
                                        <span>兴趣爱好：${c.hobby}</span><br>
                                        <span>工作：${c.job}</span>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${c.status == 1}">
                                                <span class="text-success">启用</span>
                                            </c:when>
                                            <c:when test="${c.status == 0}">
                                                <span class="text-danger">禁用</span>
                                            </c:when>
                                        </c:choose>

                                    </td>
                                    <td class="action">
                                        <c:choose>
                                            <c:when test="${c.status == 1}">
                                                <a href="javascript:void(0)" onclick="disableUser(${c.id})"
                                                   class="text-danger">禁用</a>
                                            </c:when>
                                            <c:when test="${c.status == 0}">
                                                <a href="javascript:void(0)" onclick="enableUser(${c.id})"
                                                   class="text-success">启用</a>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <%@ include file="../common/page.jsp" %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%@ include file="../common/footer.jsp" %>


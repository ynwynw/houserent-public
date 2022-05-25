<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/head.jsp" %>
<section class="p-0">
    <div class="container-fluid p-0">
        <div class="row">
            <%@ include file="../common/admin-left.jsp" %>
            <div class="col-lg-9 col-md-8 col-sm-12">
                <div class="dashboard-body">
                    <div class="frm_submit_block">
                        <h4>房屋管理&nbsp<a href="/admin/house/publish" class="btn btn-theme bg-2 btn-sm">发布新房源</a></h4>
                    </div>
                    <div class="row">
                        <c:forEach items="${pageInfo.records}" var="c">
                            <div class="col-lg-4">
                                <div class="dashboard_property_list">
                                    <div class="dashboard_property_list_thumb">
                                        <img src="${c.thumbnailUrl}" class="img-fluid"/>
                                        <c:choose>
                                            <c:when test="${c.status == 0}">
                                                <span class="dashboard_pr_status">未租出</span>
                                            </c:when>
                                            <c:when test="${c.status == 1}">
                                                <span class="dashboard_pr_status published">已租出</span>
                                            </c:when>
                                            <c:when test="${c.status == -1}">
                                                <span class="dashboard_pr_status expire">已下架</span>
                                            </c:when>
                                            <c:when test="${c.status == -2}">
                                                <span class="dashboard_pr_status expire">待审核</span>
                                            </c:when>
                                            <c:when test="${c.status == -3}">
                                                <span class="dashboard_pr_status expire">审核不通过</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="dashboard_pr_status">未知状态</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="dashboard_property_list_content">
                                        <h4><a href="/house/detail/${c.id}">${c.title}</a></h4>
                                        <span><i class="ti-location-pin"></i>${c.address}</span>
                                    </div>
                                    <div class="dashboard_property_list_footer">
                                        <a href="/house/detail/${c.id}" title="查看">&nbsp;<i
                                                class="ti-eye"></i>&nbsp;</a>
                                            <%--已租出的房子无法修改信息--%>
                                        <c:if test="${c.status != 1}">
                                            <a href="/admin/house/publish?id=${c.id}" title="编辑">&nbsp;<i
                                                    class="ti-pencil"></i>&nbsp;</a>
                                        </c:if>
                                            <%--已下架的房屋可以上架功能--%>
                                        <c:if test="${c.status == -1}">
                                            <a href="javascript:void(0)" onclick="upHouse(${c.id})" title="上架">&nbsp;<i
                                                    class="ti-control-play"></i>&nbsp;</a>
                                        </c:if>
                                            <%--已上架的房屋可以下架功能--%>
                                        <c:if test="${c.status == 0}">
                                            <a href="javascript:void(0)" onclick="downHouse(${c.id})"
                                               title="下架">&nbsp;<i class="ti-control-pause"></i>&nbsp;</a>
                                        </c:if>
                                            <%--删除房屋--%>
                                        <c:if test="${c.status != 1}">
                                            <a href="javascript:void(0)" onclick="deleteHouse(${c.id})" title="删除">&nbsp;<i
                                                    class="ti-close"></i>&nbsp;</a>
                                        </c:if>
                                        <c:if test="${isAdmin && c.status == -2}">
                                            <a href="javascript:void(0)" onclick="checkPassHouse(${c.id})" title="审核通过">&nbsp;<i
                                                    class="ti-arrow-up"></i>&nbsp;</a>
                                            <a href="javascript:void(0)" onclick="checkRejectHouse(${c.id})"
                                               title="审核驳回">&nbsp;<i class="ti-arrow-down"></i>&nbsp;</a>

                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
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


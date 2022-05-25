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
                            <h4>我的家</h4>
                        </div>
                        <table class="property-table-wrap responsive-table bkmark">
                            <tbody>
                            <tr>
                                <th><i class="fa fa-file"></i>我的家信息</th>
                                <th>类型</th>
                                <th>房东</th>
                            </tr>
                            <c:forEach items="${pageInfo.records}" var="c">
                                <tr>
                                    <td class="dashboard_propert_wrapper">
                                        <img src="${c.house.thumbnailUrl}">
                                        <div class="title">
                                            <h4><a href="/house/detail/${c.houseId}"
                                                   target="_blank">${c.house.title}</a>
                                            </h4>
                                            <span>${c.house.address}</span>
                                            <span class="table-property-price">
                                            开始时间:<fmt:formatDate value="${c.startDate}"
                                                                 pattern="yyyy-MM-dd"></fmt:formatDate><br/>
                                            到期时间:<fmt:formatDate value="${c.endDate}"
                                                                 pattern="yyyy-MM-dd"></fmt:formatDate>
                                            </span>
                                        </div>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${c.house.rentType == 'share'}">
                                                <span class="text-success">合租</span><br>
                                                <a href="/house/detail/${c.houseId}#shareHouse" target="_blank">合租详情</a>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-success">整租</span><br>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                            ${c.ownerUser.userDisplayName}<br/>${c.ownerUser.phone}
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


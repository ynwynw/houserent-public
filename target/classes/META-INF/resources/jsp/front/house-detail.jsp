<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/head.jsp" %>
<div class="pt-5 pb-5 gray-simple">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10 col-sm-12">
                <div class="prt_detail_three_clicks">
                    <div class="pdt_clicks_title"><h3>${house.title}</h3></div>
                    <div class="pdt_clicks_price"><h4>￥${house.monthRent}/月</h4>
                        <p class="price_status">折算 ￥${house.monthRent/30}/日</p></div>
                    <div class="pdt_clicks_location"><i class="ti-location-pin"></i>${house.address}
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="featured_slick_gallery-slide">
        <c:forEach items="${house.slideImgList}" var="url">
            <div class="featured_slick_padd">
                <a href="${url}" class="mfp-gallery">
                    <img src="${url}" style="width: 100%;height: 450px;" class="img-fluid mx-auto"/>
                </a>
            </div>
        </c:forEach>
    </div>
    <section class="gray-dark">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-12">
                    <div class="property_block_wrap style-2">
                        <div data-toggle="collapse" href="#clOne" class="property_block_wrap_header">
                            <h4 class="property_block_title">房屋详细信息</h4>
                        </div>
                        <div id="clOne" class="panel-collapse collapse show">
                            <div class="block-body">
                                <ul class="deatil_features">
                                    <li>
                                        <strong>状态：</strong>
                                        <c:choose>
                                            <c:when test="${house.status == 1}">已租出</c:when>
                                            <c:when test="${house.status == 0}">未租出</c:when>
                                            <c:when test="${house.status == -1}">已下架</c:when>
                                            <c:when test="${house.status == -2}">待审核</c:when>
                                            <c:when test="${house.status == -3}">审核驳回</c:when>
                                            <c:otherwise>未知状态</c:otherwise>
                                        </c:choose>
                                    </li>
                                    <li><strong>租金：</strong>￥${house.monthRent}/月</li>
                                    <li><strong>房产证编号：</strong>${house.certificateNo}</li>
                                    <li><strong>卧室数量：</strong>${house.bedroomNum}间</li>
                                    <li><strong>卫生间数量：</strong>${house.toiletNum}间</li>
                                    <li><strong>厨房数量：</strong>${house.kitchenNum}间</li>
                                    <li><strong>客厅数量：</strong>${house.livingRoomNum}间</li>
                                    <li><strong>房屋/房间面积：</strong>${house.area}m<sup>2</sup></li>
                                    <li><strong>空调：</strong>
                                        <c:choose>
                                            <c:when test="${house.hasAirConditioner == 1}">有</c:when>
                                            <c:when test="${house.hasAirConditioner == 0}">无</c:when>
                                            <c:otherwise>错误信息</c:otherwise>
                                        </c:choose>
                                    </li>
                                    <li><strong>建成年份：</strong>${house.buildYear}</li>
                                    <li><strong>朝向：</strong>${house.direction}</li>
                                    <li><strong>楼层：</strong>${house.floor}/${house.maxFloor}</li>
                                    <li>
                                        <strong>电梯：</strong>
                                        <c:choose>
                                            <c:when test="${house.hasElevator == 1}">有</c:when>
                                            <c:when test="${house.hasElevator == 0}">无</c:when>
                                            <c:otherwise>错误信息</c:otherwise>
                                        </c:choose>
                                    </li>
                                    <li>
                                        <strong>最后一次入住开始时间：</strong>
                                        <c:choose>
                                            <c:when test="${house.lastOrderStartTime == null}">暂无</c:when>
                                            <c:otherwise><fmt:formatDate pattern="yyyy-MM-dd"
                                                                         value="${house.lastOrderStartTime}"/></c:otherwise>
                                        </c:choose>
                                    </li>
                                    <li>
                                        <strong>最后一次入住结束时间：</strong>
                                        <c:choose>
                                            <c:when test="${house.lastOrderEndTime == null}">暂无</c:when>
                                            <c:otherwise><fmt:formatDate pattern="yyyy-MM-dd"
                                                                         value="${house.lastOrderEndTime}"/></c:otherwise>
                                        </c:choose>
                                    </li>
                                    <li><strong>联系人：</strong>${house.contactName}</li>
                                    <li><strong>联系电话：</strong>${house.contactPhone}</li>
                                </ul>
                            </div>
                        </div>
                    </div>


                    <div class="property_block_wrap style-2">
                        <div data-toggle="collapse" href="#clTwo" class="property_block_wrap_header">
                            <h4 class="property_block_title">详细描述</h4>
                        </div>
                        <div id="clTwo" class="panel-collapse collapse show">
                            <div class="block-body">
                                ${house.content}
                            </div>
                        </div>
                    </div>

                    <c:if test="${house.rentType=='share'}">
                        <div class="property_block_wrap style-2" id="shareHouse">
                            <div data-toggle="collapse" href="#clThree" class="property_block_wrap_header">
                                <h4 class="property_block_title">合租信息</h4>
                            </div>
                            <div id="clThree" class="panel-collapse collapse show">
                                <div class="block-body">
                                    <div class="author-review">
                                        <div class="comment-list">
                                            <ul>
                                                <c:forEach items="${house.shareHouseList}" var="c">
                                                    <li class="article_comments_wrap">
                                                        <article>
                                                            <div class="article_comments_thumb">
                                                                <a href="/house/detail/${c.id}" target="_blank"><img
                                                                        src="${c.thumbnailUrl}"></a>
                                                            </div>
                                                            <div class="comment-details">
                                                                <a href="/house/detail/${c.id}" target="_blank"><h4
                                                                        class="author-name">${c.title}</h4></a>
                                                                <c:choose>
                                                                    <c:when test="${c.currentOrder!=null}">
                                                                        <div class="comment-text">
                                                                            <p>
                                                                                性别：${c.currentOrder.customerUser.sex}，职业：${c.currentOrder.customerUser.job}</p>
                                                                            <p>
                                                                                爱好：${c.currentOrder.customerUser.hobby}</p>
                                                                            <p>
                                                                                个人说明：${c.currentOrder.customerUser.userDesc}</p>
                                                                            <p>入住日期：<fmt:formatDate
                                                                                    value="${c.currentOrder.startDate}"
                                                                                    pattern="yyyy-MM-dd"></fmt:formatDate></p>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <div class="comment-text">暂未租出</div>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                        </article>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </c:if>

                    <div class="property_block_wrap style-2">
                        <div data-toggle="collapse" href="#clFour" class="property_block_wrap_header">
                            <h4 class="property_block_title">地图位置</h4>
                        </div>
                        <div id="clFour" class="panel-collapse collapse show">
                            <div class="block-body">
                                <div class="map-container">
                                    <iframe src="/house/map?id=${house.id}" width="100%" height="300px;"></iframe>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="property_block_wrap style-2">
                        <div data-toggle="collapse" href="#clFive" class="property_block_wrap_header">
                            <h4 class="property_block_title">房屋图片</h4>
                        </div>
                        <div id="clFive" class="panel-collapse collapse show">
                            <div class="block-body">
                                <ul class="list-gallery-inline">
                                    <c:forEach items="${house.slideImgList}" var="url">
                                        <li>
                                            <a href="${url}" class="mfp-gallery">
                                                <img src="${url}" class="img-fluid mx-auto"/>
                                            </a>
                                        </li>
                                    </c:forEach>

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-12">
                    <div class="property-sidebar">
                        <div class="like_share_wrap b-0">
                            <ul class="like_share_list">
                                <li>
                                    <a href="javascript:void(0)" class="btn btn-likes"
                                       onclick="submitMark(${house.id})"><i class="fas fa-heart"></i>收藏</a>
                                </li>
                            </ul>
                        </div>

                        <div class="agent-_blocks_wrap b-0">
                            <div class="side-booking-header">
                                <h3 class="price">
                                    价格：￥<fmt:formatNumber value="${house.monthRent/30}" pattern="#"
                                                          type="number"></fmt:formatNumber>&nbsp;/&nbsp;日
                                </h3>
                            </div>
                            <div class="side-booking-body">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label>入住日期（即今日）</label>
                                            <div class="cld-box">
                                                <i class="ti-calendar"></i>
                                                <input type="text" name="checkin" id="startDate" class="form-control"
                                                       disabled/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label>退房日期（请选择）</label>
                                            <div class="cld-box">
                                                <i class="ti-calendar"></i>
                                                <input type="text" name="checkout" id="endDate" class="form-control"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <c:choose>
                                                <c:when test="${house.status == 0}">
                                                    <a href="javascript:void(0);"
                                                       class="btn btn-md full-width btn-theme bg-2"
                                                       onclick="createOrder()">立即预定</a>
                                                </c:when>
                                                <c:when test="${house.status == 1}">
                                                    <a href="javascript:void(0);"
                                                       class="btn btn-md full-width btn-theme bg-red" disabled>已租出</a>
                                                </c:when>
                                                <c:when test="${house.status == -1}">
                                                    <a href="javascript:void(0);"
                                                       class="btn btn-md full-width btn-theme bg-red" disabled>已下架</a>
                                                </c:when>
                                                <c:when test="${house.status == -2}">
                                                    <a href="javascript:void(0);"
                                                       class="btn btn-md full-width btn-theme bg-red" disabled>待审核</a>
                                                </c:when>
                                                <c:when test="${house.status == -3}">
                                                    <a href="javascript:void(0);"
                                                       class="btn btn-md full-width btn-theme bg-red" disabled>审核未通过</a>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="agent-_blocks_wrap b-0">
                            <div class="side-block-header">
                                <h3 class="title">联系房东</h3>
                            </div>
                            <div class="side-block-body">
                                <form id="contactForm">
                                    <input type="hidden" id="houseId" name="houseId" value="${house.id}">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-6">
                                            <div class="form-group">
                                                <input type="text" class="form-control" name="name" placeholder="我的姓名">
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-6">
                                            <div class="form-group">
                                                <input type="text" class="form-control" name="email" placeholder="我的邮箱">
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-6">
                                            <div class="form-group">
                                                <input type="text" class="form-control" name="phone"
                                                       placeholder="我的手机号">
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-6">
                                            <div class="form-group">
                                                <textarea class="form-control" name="content"
                                                          placeholder="想要发的信息内容"></textarea>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-6">
                                            <div class="form-group">
                                                <a href="javascript:void(0)" onclick="submitContact()"
                                                   class="btn btn-md full-width btn-theme bg-2">发送邮件咨询</a>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>


    <%@ include file="../common/footer.jsp" %>
    <script>
        var now = new Date();
        var year = now.getFullYear();
        var month = now.getMonth() + 1;
        var date = now.getDate();
        var today = month + "/" + date + "/" + year;
        $('input[name="checkin"]').val(today);
        $('input[name="checkout"]').daterangepicker({
            singleDatePicker: true,
            format: "yyyy-MM-dd"
        });
    </script>

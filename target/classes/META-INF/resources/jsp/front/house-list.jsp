<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/head.jsp" %>
<section class="gray-simple">
    <div class="container">
        <div class="row">
            <%--左侧开始--%>
            <div class="col-lg-4 col-md-12 col-sm-12">
                <div class="page-sidebar">
                    <form action="/house" method="get">
                        <div class="form-group">
                            <select name="city" id="city" class="form-control">
                                <option value=""></option>
                                <option value="北京" <c:if test="${houseSearchVO.city == '北京'}">selected</c:if>>北京
                                </option>
                                <option value="天津" <c:if test="${houseSearchVO.city == '天津'}">selected</c:if>>天津
                                </option>
                                <option value="河北" <c:if test="${houseSearchVO.city == '河北'}">selected</c:if>>河北
                                </option>
                                <option value="山西" <c:if test="${houseSearchVO.city == '山西'}">selected</c:if>>山西
                                </option>
                                <option value="内蒙古" <c:if test="${houseSearchVO.city == '内蒙古'}">selected</c:if>>内蒙古
                                </option>
                                <option value="辽宁" <c:if test="${houseSearchVO.city == '辽宁'}">selected</c:if>>辽宁
                                </option>
                                <option value="吉林" <c:if test="${houseSearchVO.city == '吉林'}">selected</c:if>>吉林
                                </option>
                                <option value="黑龙江" <c:if test="${houseSearchVO.city == '黑龙江'}">selected</c:if>>黑龙江
                                </option>
                                <option value="上海" <c:if test="${houseSearchVO.city == '上海'}">selected</c:if>>上海
                                </option>
                                <option value="江苏" <c:if test="${houseSearchVO.city == '江苏'}">selected</c:if>>江苏
                                </option>
                                <option value="浙江" <c:if test="${houseSearchVO.city == '浙江'}">selected</c:if>>浙江
                                </option>
                                <option value="安徽" <c:if test="${houseSearchVO.city == '安徽'}">selected</c:if>>安徽
                                </option>
                                <option value="福建" <c:if test="${houseSearchVO.city == '福建'}">selected</c:if>>福建
                                </option>
                                <option value="江西" <c:if test="${houseSearchVO.city == '江西'}">selected</c:if>>江西
                                </option>
                                <option value="山东" <c:if test="${houseSearchVO.city == '山东'}">selected</c:if>>山东
                                </option>
                                <option value="河南" <c:if test="${houseSearchVO.city == '河南'}">selected</c:if>>河南
                                </option>
                                <option value="湖北" <c:if test="${houseSearchVO.city == '湖北'}">selected</c:if>>湖北
                                </option>
                                <option value="湖南" <c:if test="${houseSearchVO.city == '湖南'}">selected</c:if>>湖南
                                </option>
                                <option value="广东" <c:if test="${houseSearchVO.city == '广东'}">selected</c:if>>广东
                                </option>
                                <option value="广西" <c:if test="${houseSearchVO.city == '广西'}">selected</c:if>>广西
                                </option>
                                <option value="海南" <c:if test="${houseSearchVO.city == '海南'}">selected</c:if>>海南
                                </option>
                                <option value="重庆" <c:if test="${houseSearchVO.city == '重庆'}">selected</c:if>>重庆
                                </option>
                                <option value="四川" <c:if test="${houseSearchVO.city == '四川'}">selected</c:if>>四川
                                </option>
                                <option value="贵州" <c:if test="${houseSearchVO.city == '贵州'}">selected</c:if>>贵州
                                </option>
                                <option value="云南" <c:if test="${houseSearchVO.city == '云南'}">selected</c:if>>云南
                                </option>
                                <option value="西藏" <c:if test="${houseSearchVO.city == '西藏'}">selected</c:if>>西藏
                                </option>
                                <option value="陕西" <c:if test="${houseSearchVO.city == '陕西'}">selected</c:if>>陕西
                                </option>
                                <option value="甘肃" <c:if test="${houseSearchVO.city == '甘肃'}">selected</c:if>>甘肃
                                </option>
                                <option value="青海" <c:if test="${houseSearchVO.city == '青海'}">selected</c:if>>青海
                                </option>
                                <option value="宁夏" <c:if test="${houseSearchVO.city == '宁夏'}">selected</c:if>>宁夏
                                </option>
                                <option value="新疆" <c:if test="${houseSearchVO.city == '新疆'}">selected</c:if>>新疆
                                </option>
                                <option value="香港" <c:if test="${houseSearchVO.city == '香港'}">selected</c:if>>香港
                                </option>
                                <option value="澳门" <c:if test="${houseSearchVO.city == '澳门'}">selected</c:if>>澳门
                                </option>
                                <option value="台湾" <c:if test="${houseSearchVO.city == '台湾'}">selected</c:if>>台湾
                                </option>
                                <option value="英国" <c:if test="${houseSearchVO.city == '英国'}">selected</c:if>>英国
                                </option>
                                <option value="美国" <c:if test="${houseSearchVO.city == '美国'}">selected</c:if>>美国
                                </option>
                                <option value="西班牙" <c:if test="${houseSearchVO.city == '西班牙'}">selected</c:if>>西班牙
                                </option>
                            </select>
                        </div>
                        <div class="form-group">
                            <select name="rentType" id="selectRentType" class="form-control">
                                <option value=""></option>
                                <option value="whole" <c:if test="${houseSearchVO.rentType == 'whole'}">selected</c:if>>
                                    整租
                                </option>
                                <option value="share" <c:if test="${houseSearchVO.rentType == 'share'}">selected</c:if>>
                                    合租
                                </option>
                            </select>
                        </div>
                        <div class="form-group">
                            <div class="input-with-icon">
                                <input type="text" id="address" name="address" class="form-control" placeholder="小区"
                                       value="${houseSearchVO.address}">
                                <i class="ti-search"></i>
                            </div>
                        </div>
                        <div class="form-group">
                            <h6>选择价格范围</h6>
                            <div>
                                <input type="text" class="js-range-slider-price" name="priceRange">
                            </div>
                        </div>
                        <div class="form-group">
                            <h6>选择面积范围</h6>
                            <div>
                                <input type="text" class="js-range-slider-area" name="areaRange">
                            </div>
                        </div>
                        <div>
                            <button type="submit" class="btn btn-theme full-width bg-2">搜索</button>
                        </div>
                    </form>
                </div>
            </div>
            <%--左侧结束--%>
            <%--右侧开始--%>
            <div class="col-lg-8 col-md-12 col-sm-12">
                <div class="row">
                    <c:forEach items="${pageInfo.records}" var="c">
                        <div class="col-lg-6 col-md-6 col-sm-12">
                            <div class="single_property_style property_style_2 modern">
                                <div class="listing_thumb_wrapper">
                                    <a href="/house/detail/${c.id}"><img src="${c.thumbnailUrl}"
                                                                         class="img-fluid mx-auto"></a>
                                </div>
                                <div class="property_caption_wrappers pb-0">
                                    <div class="property_short_detail">
                                        <div class="pr_type_status">
                                            <h4 class="pr-property_title mb-1"><a
                                                    href="/house/detail/${c.id}">${c.title}</a></h4>
                                            <div class="listing-location-name">
                                                <a href="/house/detail/${c.id}">${c.address}</a>
                                            </div>
                                        </div>
                                        <div class="property-real-price">
                                            <a href="/house/detail/${c.id}" class="cl-blue">￥${c.monthRent}<span
                                                    class="price_status">/月 - ￥${c.monthRent/30}/日</span></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="modern_property_footer">
                                    <div class="property-lists flex-1">
                                        <ul>
                                            <li>
                                                <span class="flatcons"><img
                                                        src="/assets/img/bed.svg"></span>${c.bedroomNum}间卧室
                                            </li>
                                            <li>
                                                <span class="flatcons"><img
                                                        src="/assets/img/bath.svg"></span>${c.toiletNum}间卫生间
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="fp_types">
                                        <a href="javascript:void(0)" class="markHouse"
                                           onclick="submitMark(${c.id})">收藏</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="row">
                    <%@ include file="../common/page.jsp" %>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="../common/footer.jsp" %>
<script>

    var minPrice = ${houseSearchVO.minPrice};
    var maxPrice = ${houseSearchVO.maxPrice};
    var minArea = ${houseSearchVO.minArea};
    var maxArea = ${houseSearchVO.maxArea};

    $(".js-range-slider-price").ionRangeSlider({
        type: "double",
        min: 0,
        max: 20000,
        from: minPrice,
        to: maxPrice,
        grid: true
    });

    $(".js-range-slider-area").ionRangeSlider({
        type: "double",
        min: 0,
        max: 150,
        from: minArea,
        to: maxArea,
        grid: true
    });
</script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/head.jsp" %>
<link rel="stylesheet" href="/assets/plugins/bootstrap-fileinput/css/fileinput.min.css">
<script src="/assets/plugins/bootstrap-fileinput/js/fileinput.js"></script>
<script src="/assets/plugins/bootstrap-fileinput/js/locales/zh.js"></script>
<!--富文本编辑器wangEditor-->
<link href="https://cdn.staticfile.org/wangEditor/10.0.13/wangEditor.min.css" rel="stylesheet">
<link href="https://cdn.staticfile.org/wangEditor/10.0.13/fonts/w-e-icon.woff" rel="stylesheet">
<script src="https://cdn.staticfile.org/wangEditor/10.0.13/wangEditor.min.js"></script>
<section class="p-0">
    <div class="container-fluid p-0">
        <div class="row">
            <%@ include file="../common/admin-left.jsp" %>
            <div class="col-lg-9 col-md-8 col-sm-12">
                <div class="col-lg-9 col-md-8 col-sm-12">
                    <section style="padding-top: 10px;">
                        <div class="container">
                            <div class="row">
                                <form id="houseForm">
                                    <input type="hidden" id="id" name="id" value="${house.id}">
                                    <input type="hidden" id="key" name="key">
                                    <div class="col-lg-12 col-md-12">
                                        <div class="submit-page form-simple">
                                            <div class="frm_submit_block">
                                                <h3>基本信息</h3>
                                                <div class="form-row">
                                                    <div class="form-group col-md-6">
                                                        <label>出租类型</label>
                                                        <select name="rentType" class="form-control">
                                                            <option value="whole"
                                                                    <c:if test="${house.rentType == 'whole'}">selected</c:if>>
                                                                整租
                                                            </option>
                                                            <option value="share"
                                                                    <c:if test="${house.rentType == 'share'}">selected</c:if>>
                                                                合租
                                                            </option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>月租金 <a href="#" class="tip-topdata"
                                                                      data-tip="日租金 = 月租金 / 30"><i class="ti-help"></i></a></label>
                                                        <input type="number" name="monthRent" class="form-control"
                                                               value="${house.monthRent}">
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>所属城市</label>
                                                        <select name="city" class="form-control">
                                                            <option value="北京"
                                                                    <c:if test="${house.city == '北京'}">selected</c:if>>
                                                                北京
                                                            </option>
                                                            <option value="天津"
                                                                    <c:if test="${house.city == '天津'}">selected</c:if>>
                                                                天津
                                                            </option>
                                                            <option value="河北"
                                                                    <c:if test="${house.city == '河北'}">selected</c:if>>
                                                                河北
                                                            </option>
                                                            <option value="山西"
                                                                    <c:if test="${house.city == '山西'}">selected</c:if>>
                                                                山西
                                                            </option>
                                                            <option value="内蒙古"
                                                                    <c:if test="${house.city == '内蒙古'}">selected</c:if>>
                                                                内蒙古
                                                            </option>
                                                            <option value="辽宁"
                                                                    <c:if test="${house.city == '辽宁'}">selected</c:if>>
                                                                辽宁
                                                            </option>
                                                            <option value="吉林"
                                                                    <c:if test="${house.city == '吉林'}">selected</c:if>>
                                                                吉林
                                                            </option>
                                                            <option value="黑龙江"
                                                                    <c:if test="${house.city == '黑龙江'}">selected</c:if>>
                                                                黑龙江
                                                            </option>
                                                            <option value="上海"
                                                                    <c:if test="${house.city == '上海'}">selected</c:if>>
                                                                上海
                                                            </option>
                                                            <option value="江苏"
                                                                    <c:if test="${house.city == '江苏'}">selected</c:if>>
                                                                江苏
                                                            </option>
                                                            <option value="浙江"
                                                                    <c:if test="${house.city == '浙江'}">selected</c:if>>
                                                                浙江
                                                            </option>
                                                            <option value="安徽"
                                                                    <c:if test="${house.city == '安徽'}">selected</c:if>>
                                                                安徽
                                                            </option>
                                                            <option value="福建"
                                                                    <c:if test="${house.city == '福建'}">selected</c:if>>
                                                                福建
                                                            </option>
                                                            <option value="江西"
                                                                    <c:if test="${house.city == '江西'}">selected</c:if>>
                                                                江西
                                                            </option>
                                                            <option value="山东"
                                                                    <c:if test="${house.city == '山东'}">selected</c:if>>
                                                                山东
                                                            </option>
                                                            <option value="河南"
                                                                    <c:if test="${house.city == '河南'}">selected</c:if>>
                                                                河南
                                                            </option>
                                                            <option value="湖北"
                                                                    <c:if test="${house.city == '湖北'}">selected</c:if>>
                                                                湖北
                                                            </option>
                                                            <option value="湖南"
                                                                    <c:if test="${house.city == '湖南'}">selected</c:if>>
                                                                湖南
                                                            </option>
                                                            <option value="广东"
                                                                    <c:if test="${house.city == '广东'}">selected</c:if>>
                                                                广东
                                                            </option>
                                                            <option value="广西"
                                                                    <c:if test="${house.city == '广西'}">selected</c:if>>
                                                                广西
                                                            </option>
                                                            <option value="海南"
                                                                    <c:if test="${house.city == '海南'}">selected</c:if>>
                                                                海南
                                                            </option>
                                                            <option value="重庆"
                                                                    <c:if test="${house.city == '重庆'}">selected</c:if>>
                                                                重庆
                                                            </option>
                                                            <option value="四川"
                                                                    <c:if test="${house.city == '四川'}">selected</c:if>>
                                                                四川
                                                            </option>
                                                            <option value="贵州"
                                                                    <c:if test="${house.city == '贵州'}">selected</c:if>>
                                                                贵州
                                                            </option>
                                                            <option value="云南"
                                                                    <c:if test="${house.city == '云南'}">selected</c:if>>
                                                                云南
                                                            </option>
                                                            <option value="西藏"
                                                                    <c:if test="${house.city == '西藏'}">selected</c:if>>
                                                                西藏
                                                            </option>
                                                            <option value="陕西"
                                                                    <c:if test="${house.city == '陕西'}">selected</c:if>>
                                                                陕西
                                                            </option>
                                                            <option value="甘肃"
                                                                    <c:if test="${house.city == '甘肃'}">selected</c:if>>
                                                                甘肃
                                                            </option>
                                                            <option value="青海"
                                                                    <c:if test="${house.city == '青海'}">selected</c:if>>
                                                                青海
                                                            </option>
                                                            <option value="宁夏"
                                                                    <c:if test="${house.city == '宁夏'}">selected</c:if>>
                                                                宁夏
                                                            </option>
                                                            <option value="新疆"
                                                                    <c:if test="${house.city == '新疆'}">selected</c:if>>
                                                                新疆
                                                            </option>
                                                            <option value="香港"
                                                                    <c:if test="${house.city == '香港'}">selected</c:if>>
                                                                香港
                                                            </option>
                                                            <option value="澳门"
                                                                    <c:if test="${house.city == '澳门'}">selected</c:if>>
                                                                澳门
                                                            </option>
                                                            <option value="台湾"
                                                                    <c:if test="${house.city == '台湾'}">selected</c:if>>
                                                                台湾
                                                            </option>
                                                            <option value="英国"
                                                                    <c:if test="${house.city == '英国'}">selected</c:if>>
                                                                英国
                                                            </option>
                                                            <option value="美国"
                                                                    <c:if test="${house.city == '美国'}">selected</c:if>>
                                                                美国
                                                            </option>
                                                            <option value="西班牙"
                                                                    <c:if test="${house.city == '西班牙'}">selected</c:if>>
                                                                西班牙
                                                            </option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>房屋标题信息 <a href="#" class="tip-topdata"
                                                                         data-tip="如：合租-重庆市渝中区-4居室-3卧室-高层"><i
                                                                class="ti-help"></i></a></label>
                                                        <input type="text" name="title" class="form-control"
                                                               value="${house.title}">
                                                    </div>
                                                    <div class="form-group col-md-8">
                                                        <label>房屋详细地址信息 <a href="#" class="tip-topdata"
                                                                           data-tip="如：重庆市渝中区解放碑星光天地8楼605号房"><i
                                                                class="ti-help"></i></a></label>
                                                        <input type="text" name="address" class="form-control"
                                                               value="${house.address}">
                                                    </div>
                                                    <div class="form-group col-md-4">
                                                        <label>
                                                            经纬度坐标&nbsp;<a
                                                                href="https://api.map.baidu.com/lbsapi/getpoint/index.html"
                                                                target="_blank">获取金纬度</a>
                                                            <a href="#" class="tip-topdata"
                                                               data-tip="如：113.123456,22.5678"><i
                                                                    class="ti-help"></i></a></label>
                                                        <input type="text" name="longitudeLatitude"
                                                               class="form-control" value="${house.longitudeLatitude}">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="frm_submit_block">
                                                <h3>房屋结构</h3>
                                                <div class="form-row">
                                                    <div class="form-group col-md-6">
                                                        <label>房产证号</label>
                                                        <input type="text" name="certificateNo" class="form-control"
                                                               value="${house.certificateNo}">
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>面积 <a href="#" class="tip-topdata"
                                                                     data-tip="整租类型时为整个房屋面积，合租类型是为单间面积"><i
                                                                class="ti-help"></i></a></label>
                                                        <input type="text" name="area" class="form-control"
                                                               value="${house.area}">
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>朝向</label>
                                                        <input type="text" name="direction" class="form-control"
                                                               value="${house.direction}">
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>是否有空调</label>
                                                        <select name="hasAirConditioner" class="form-control">
                                                            <option value="1"
                                                                    <c:if test="${house.hasAirConditioner == '1'}">selected</c:if>>
                                                                有空调
                                                            </option>
                                                            <option value="0"
                                                                    <c:if test="${house.hasAirConditioner == '0'}">selected</c:if>>
                                                                无空调
                                                            </option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>卧室数量</label>
                                                        <select name="bedroomNum" class="form-control">
                                                            <option value="1"
                                                                    <c:if test="${house.bedroomNum == '1'}">selected</c:if>>
                                                                1个
                                                            </option>
                                                            <option value="2"
                                                                    <c:if test="${house.bedroomNum == '2'}">selected</c:if>>
                                                                2个
                                                            </option>
                                                            <option value="3"
                                                                    <c:if test="${house.bedroomNum == '3'}">selected</c:if>>
                                                                3个
                                                            </option>
                                                            <option value="4"
                                                                    <c:if test="${house.bedroomNum == '4'}">selected</c:if>>
                                                                4个
                                                            </option>
                                                            <option value="5"
                                                                    <c:if test="${house.bedroomNum == '5'}">selected</c:if>>
                                                                5个
                                                            </option>
                                                            <option value="6"
                                                                    <c:if test="${house.bedroomNum == '6'}">selected</c:if>>
                                                                6个
                                                            </option>
                                                            <option value="7"
                                                                    <c:if test="${house.bedroomNum == '7'}">selected</c:if>>
                                                                7个
                                                            </option>
                                                            <option value="8"
                                                                    <c:if test="${house.bedroomNum == '8'}">selected</c:if>>
                                                                8个
                                                            </option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>客厅数量</label>
                                                        <select name="livingRoomNum" class="form-control">
                                                            <option value="1"
                                                                    <c:if test="${house.livingRoomNum == '1'}">selected</c:if>>
                                                                1个
                                                            </option>
                                                            <option value="2"
                                                                    <c:if test="${house.livingRoomNum == '2'}">selected</c:if>>
                                                                2个
                                                            </option>
                                                            <option value="3"
                                                                    <c:if test="${house.livingRoomNum == '3'}">selected</c:if>>
                                                                3个
                                                            </option>
                                                            <option value="4"
                                                                    <c:if test="${house.livingRoomNum == '4'}">selected</c:if>>
                                                                4个
                                                            </option>
                                                            <option value="5"
                                                                    <c:if test="${house.livingRoomNum == '5'}">selected</c:if>>
                                                                5个
                                                            </option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>厨房数量</label>
                                                        <select name="kitchenNum" class="form-control">
                                                            <option value="1"
                                                                    <c:if test="${house.kitchenNum == '1'}">selected</c:if>>
                                                                1个
                                                            </option>
                                                            <option value="2"
                                                                    <c:if test="${house.kitchenNum == '2'}">selected</c:if>>
                                                                2个
                                                            </option>
                                                            <option value="3"
                                                                    <c:if test="${house.kitchenNum == '3'}">selected</c:if>>
                                                                3个
                                                            </option>
                                                            <option value="4"
                                                                    <c:if test="${house.kitchenNum == '4'}">selected</c:if>>
                                                                4个
                                                            </option>
                                                            <option value="5"
                                                                    <c:if test="${house.kitchenNum == '5'}">selected</c:if>>
                                                                5个
                                                            </option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>卫生间数量</label>
                                                        <select name="toiletNum" class="form-control">
                                                            <option value="1"
                                                                    <c:if test="${house.toiletNum == '1'}">selected</c:if>>
                                                                1个
                                                            </option>
                                                            <option value="2"
                                                                    <c:if test="${house.toiletNum == '2'}">selected</c:if>>
                                                                2个
                                                            </option>
                                                            <option value="3"
                                                                    <c:if test="${house.toiletNum == '3'}">selected</c:if>>
                                                                3个
                                                            </option>
                                                            <option value="4"
                                                                    <c:if test="${house.toiletNum == '4'}">selected</c:if>>
                                                                4个
                                                            </option>
                                                            <option value="5"
                                                                    <c:if test="${house.toiletNum == '5'}">selected</c:if>>
                                                                5个
                                                            </option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="frm_submit_block">
                                                <h3>建筑信息</h3>
                                                <div class="form-row">
                                                    <div class="form-group col-md-6">
                                                        <label>建成年份</label>
                                                        <input type="number" name="buildYear" class="form-control"
                                                               value="${house.buildYear}">
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>所在楼层</label>
                                                        <input type="text" name="floor" class="form-control"
                                                               value="${house.floor}">
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>总楼层</label>
                                                        <input type="text" name="maxFloor" class="form-control"
                                                               value="${house.maxFloor}">
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>是否有电梯</label>
                                                        <select name="hasElevator" class="form-control">
                                                            <option value="1"
                                                                    <c:if test="${house.hasElevator == '1'}">selected</c:if>>
                                                                有电梯
                                                            </option>
                                                            <option value="0"
                                                                    <c:if test="${house.hasElevator == '0'}">selected</c:if>>
                                                                无电梯
                                                            </option>
                                                        </select>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="frm_submit_block">
                                                <h3>联系人信息</h3>
                                                <div class="form-row">
                                                    <div class="form-group col-md-6">
                                                        <label>联系人姓名</label>
                                                        <input type="text" name="contactName" class="form-control"
                                                               value="${house.contactName}">
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>联系人电话</label>
                                                        <input type="text" name="contactPhone" class="form-control"
                                                               value="${house.contactPhone}">
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="frm_submit_block">
                                                <h3>房屋描述</h3>
                                                <div class="form-row">
                                                    <div class="form-group col-md-12">
                                                        <label>请对您将要租赁的房屋进行详细描述（如配套设施、周边情况等）</label>
                                                        <textarea name="content" class="form-control ht-120"
                                                                  id="content"
                                                                  style="display: none;">${house.content}</textarea>
                                                        <%--富文本编辑器测试区域--%>
                                                        <div id="div1">
                                                            <p>${house.content}</p>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="frm_submit_block">
                                                <h3>轮播图上传</h3>
                                                <p>请使用PNG JPG JPEG GIF类型的图片上传</p>
                                                <div class="form-row">
                                                    <div class="form-group col-md-12">
                                                        <input type="file" name="file" id="file" multiple
                                                               class="file-loading"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-lg-12 col-md-12">
                                                    <button class="btn btn-theme bg-2" type="button"
                                                            onclick="submitHouse()">发布
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
</section>
<%@ include file="../common/footer.jsp" %>
<script>
    $(function () {
        var timestamp = Date.parse(new Date());
        $("#key").val(timestamp);
        $("#file").fileinput({
            language: 'zh', //设置语言
            uploadUrl: '/file/upload?key=' + timestamp, //上传地址
            allowedFileExtensions: ['png', 'jpg', 'jpeg', 'gif'], //允许上传的文件拓展名
            showUpload: true, //显示可以批量上传按钮
            showCaption: false //不显示标题
        });

    });
</script>
<%--同步修改textarea中的H5内容--%>
<script type="text/javascript">
    var E = window.wangEditor
    var editor = new E('#div1')
    var $text1 = $('#content')
    editor.customConfig.onchange = function (html) {
        // 监控变化，同步更新到 textarea
        $text1.val(html)
    }
    editor.create()
    // 初始化 textarea 的值
    $text1.val(editor.txt.html())
</script>
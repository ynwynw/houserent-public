<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/head.jsp" %>
<section class="gray-simple">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12">
                <div class="property_block_wrap style-2">
                    <div id="content" style="padding: 10px;">
                        <h2 class="property_block_title" style="text-align: center">房屋租赁合同</h2>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;出租方：<strong>${order.ownerUser.userDisplayName}</strong> (以下简称甲方)</p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;身份证号码：<strong>${order.ownerUser.idCard}</strong></p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;承租方：<strong>${order.customerUser.userDisplayName}</strong> (以下简称乙方)
                        </p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;身份证号码：<strong>${order.customerUser.idCard}</strong></p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;经甲、乙双方在自愿、平等、互利的基础上，经协商一致，就房屋租赁事宜达成如下协议，以供双方遵守：</p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;一、房屋地址：<strong>${order.house.address}</strong>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;二、房屋名称<strong>${order.house.title}</strong></p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;三、租赁期限及约定</p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.该房屋租赁期共 <strong>${order.dayNum}</strong>
                            天。自 <strong>
                                <fmt:formatDate pattern="yyyy-MM-dd" value="${order.startDate}"/>
                            </strong> 到
                            <strong><fmt:formatDate pattern="yyyy-MM-dd" value="${order.endDate}"/>
                            </strong>
                        </p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.房屋租金(每月按30天计算)：每日 <strong>
                            <fmt:formatNumber pattern="#" type="number" value="${order.monthRent/30}"/> 元</strong>，天数
                            <strong>${order.dayNum}</strong> 天，押金 <strong>0</strong> 元，共计
                            <strong>${order.totalAmount}</strong>元。</p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.房屋终止，甲方验收无误后，将押金退还乙方，不计利息。</p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.乙方向甲方承诺，租赁该房屋仅作为普通住房使用。</p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.乙方对承租的房屋及室内装修设备，应负责保管，爱护使用，注意防火、防冻。如有损坏，乙方应
                            负责修复或赔偿。楼梯间、门道、走廊等公用房屋和设施，乙方应爱护使用，注意照管，防止损坏。</p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.乙方不得私自拆改、增添房屋或设备。如属必需时，应事先取得甲方同意或另行签订协议后方可动
                            工。否则，乙方应负责恢复原状或承担相应赔偿。</p>

                        <p>&nbsp;&nbsp;&nbsp;&nbsp;本协议一式两份，甲、乙两房各执一份，乙方支付后即时生效。</p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;甲方签字：________________________乙方签字：________________________</p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;联系方式：________________________联系方式：________________________</p>
                    </div>
                    <div style="text-align: center;margin-top: 50px;">
                        <c:choose>
                            <c:when test="${order.status==-2}">
                                <a href="javascript:void(0)" onclick="confirmAgreement(${order.id})"
                                   class="btn btn-primary">我已阅读并同意上述合同</a>
                            </c:when>
                            <c:when test="${order.status==-1}"><a href="/order/pay?orderId=${order.id}">去付款</a></c:when>
                            <c:when test="${order.status==0}">合同已生效</c:when>
                            <c:when test="${order.status==1}">合同已到期</c:when>
                            <c:when test="${order.status==2}">已申请退租</c:when>
                            <c:when test="${order.status==3}">退租申请驳回</c:when>
                            <c:when test="${order.status==-3}">已取消</c:when>
                        </c:choose>
                    </div>
                    <div style="text-align: center;">
                        <a href="javascript:void(0)" onclick="printHtml('content')">打印合同</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="../common/footer.jsp" %>
<script>
    function printHtml(div) {
        var before = "<html><head><meta http-equiv='Content-Type' content='text/html;charset=UTF-8'></head><body >";
        var print = document.getElementById(div).innerHTML;
        var result = before + print + "</body></html>"
        console.log(result);
        var wind = window.open("", 'newwindow', 'height=300,width=700,top=100,left=100,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
        wind.document.body.innerHTML = result;
        wind.print();
        return false;
    }
</script>
</body>
</html>
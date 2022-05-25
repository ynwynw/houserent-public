<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/head.jsp" %>
<link rel="stylesheet" href="/assets/css/pay.css">
<link rel="stylesheet" type="text/css" href="/assets/payment/css/amazeui.min.css"/>
<link rel="stylesheet" type="text/css" href="/assets/payment/css/main.css"/>
<script type="text/javascript" src="/assets/payment/js/amazeui.min.js"></script>
<script type="text/javascript" src="/assets/payment/js/ui-choose.js"></script>

<section class="gray-simple">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12">
                <div class="mod-ct">
                    <div class="order">
                        ${order.house.title}
                    </div>
                    <div class="order">
                        订单ID：${order.id}
                    </div>
                    <div class="amount" id="money" style="color: #0ac186">
                        ￥${order.totalAmount}
                    </div>
                    <div>
                        <p>您当前账户余额：<strong>￥${sessionScope.user.balance}</strong></p>
                    </div>
                    <div style="position: relative;display: inline-block;">
                        <img src="/assets/img/alipay_qrcode.png" width="200" height="200"
                             style="display: block;margin: 20px;">
                    </div>
                    <div class="time-item">
                        <h1>支付完成后，将跳转到订单列表页面</h1>
                    </div>
                    <div class="tip">
                        <div class="tr_rechcho form-group" id="paymentMethod">
                            <span>支付方式：</span>
                            <label class="am-radio">
                                <input type="radio" name="paymethod" id="wechat" value="1" data-am-ucheck><img
                                    src="/assets/payment/images/wechatpay.png">
                            </label>
                            <label class="am-radio" style="margin-right:30px;">
                                <input type="radio" name="paymethod" id="alipay" value="2" data-am-ucheck><img
                                    src="/assets/payment/images/zfbpay.png">
                            </label>
                            <label class="am-radio" style="margin-right:30px;">
                                <input type="radio" name="paymethod" id="balance" value="3" data-am-ucheck required><img
                                    src="/assets/payment/images/balance.png">
                            </label>
                        </div>
                    </div>

                    <div class="tip">
                        <div class="tip-text">
                            <input type="text" id="payMethod" style="display:none;">
                            <script>

                                $('input[type=radio][name=paymethod]').change(function () {
                                    // 获取input radio选中值，方法一
                                    var paymethod = $('input:radio[name="paymethod"]:checked').val();
                                    $("#payMethod").val(paymethod);
                                });
                            </script>
                            <button onclick="submitPay(${order.id},$('#payMethod').val())"
                                    class="btn btn-small btn-success"
                                    style="color: #FFFFFF;" title="立即支付">立即支付
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="../common/footer.jsp" %>
</body>
</html>
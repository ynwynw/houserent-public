<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/head.jsp" %>
<link rel="stylesheet" type="text/css" href="/assets/payment/css/amazeui.min.css"/>
<link rel="stylesheet" type="text/css" href="/assets/payment/css/main.css"/>
<div class="container-fluid p-0">
    <div class="row">
        <%@ include file="../common/admin-left.jsp" %>
        <div class="col-lg-9 col-md-8 col-sm-12">
            <div class="container-fluid">
                <div style="margin-bottom: 70px;" class="dashboard-wraper">
                    <h3>充值中心</h3>
                    <div class="pay">
                        <!--在线充值功能-->
                        <div class="tr_recharge">
                            <div class="tr_rechtext">
                                <p class="te_retit"><img src="/assets/payment/images/coin.png" alt=""/>第三方充值
                                </p>
                                <p>1.您可以为您的账号进行充值，余额可用于支付租房费用等。</p>
                                <p>2.您可以选择支付宝、微信或者余额卡的付款方式来进行充值。</p>
                            </div>
                            <div class="tr_rechbox">
                                <div class="tr_rechhead">
                                    <img src="${user.userAvatar}"/>
                                    <p>充值帐号：
                                        <a>${user.userName}</a>
                                    </p>
                                    <div class="tr_rechheadcion">
                                        <img src="/assets/payment/images/coin.png" alt=""/>
                                        <span>当前余额：<span>${user.balance}元</span></span>
                                    </div>
                                </div>
                                <div class="tr_rechli form-group">
                                    <ul class="ui-choose form-group" id="uc_01">
                                        <li>
                                            <label class="am-radio-inline">
                                                <input type="radio" value="" name="docVlGender" required>
                                                500￥
                                            </label>
                                        </li>
                                        <li>
                                            <label class="am-radio-inline">
                                                <input type="radio" name="docVlGender"> ￥1000
                                            </label>
                                        </li>

                                        <li>
                                            <label class="am-radio-inline">
                                                <input type="radio" name="docVlGender"> ￥3000
                                            </label>
                                        </li>
                                        <li>
                                            <label class="am-radio-inline">
                                                <input type="radio" name="docVlGender"> 其他金额
                                            </label>
                                        </li>
                                    </ul>
                                </div>
                                <div class="tr_rechoth form-group">
                                    <span>其他金额：</span>
                                    <input type="number" min="10" max="100000" value="10.00元" class="othbox"
                                    />
                                </div>
                                <div class="tr_rechcho form-group" id="pmt_01">
                                    <span>充值方式：</span>
                                    <label class="am-radio">
                                        <input type="radio" name="radio1" value="" data-am-ucheck
                                               required
                                        ><img
                                            src="/assets/payment/images/wechatpay.png">
                                    </label>
                                    <label class="am-radio" style="margin-right:30px;">
                                        <input type="radio" name="radio1" value="" data-am-ucheck
                                        ><img
                                            src="/assets/payment/images/zfbpay.png">
                                    </label>
                                </div>
                                <div class="tr_rechnum">
                                    <span>应付金额：</span>
                                    <p class="rechnum">0.00元</p>
                                </div>
                            </div>
                            <div class="tr_paybox">
                                <input type="submit" value="确认支付" class="tr_pay am-btn"/>
                                <span>温馨提示：充值后的余额是不可退还的。</span>
                            </div>
                        </div>
                        <%--礼品卡兑换--%>
                        <div class="tr_recharge">
                            <div class="tr_rechtext">
                                <p class="te_retit"><img src="/assets/payment/images/giftcard_index.png"
                                                         width="30px;" height="30px;"/>礼品卡充值
                                </p>
                                <p>1.您可以通过官方购买的礼品卡为您的账号充值。</p>
                            </div>
                            <div class="tr_rechbox">
                                <div class="tr_rechhead">
                                    <img src="${user.userAvatar}"/>
                                    <p>充值帐号：
                                        <a>${user.userName}</a>
                                    </p>
                                    <div class="tr_rechheadcion">
                                        <img src="/assets/payment/images/coin.png" alt=""/>
                                        <span>当前余额：<span>${user.balance}元</span></span>
                                    </div>
                                </div>
                                <div class="tr_rechcho form-group" id="giftcard">
                                    <span>充值方式：</span>
                                    <label class="am-radio" style="margin-right:30px;">
                                        <input type="radio" name="radio1" value="" data-am-ucheck checked><img
                                            src="/assets/payment/images/giftcard.png">
                                    </label>
                                </div>
                                <form class="am-form" id="giftcardForm">
                                    <p><strong>在下方输入您的代码以兑换余额</strong></p>
                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <input type="text" name="series" class="form-control"
                                                   placeholder="代码或 PIN">
                                        </div>
                                    </div>
                                </form>
                                <div class="tr_paybox">
                                    <div class="col-lg-12 col-md-12">
                                        <button class="tr_pay am-btn" type="button" onclick="redeemGiftCard()">
                                            确认兑换
                                        </button>
                                        <span>温馨提示：充值后的余额是不可退还的。</span>
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
</div>
<script type="text/javascript" src="/assets/payment/js/amazeui.min.js"></script>
<script type="text/javascript" src="/assets/payment/js/ui-choose.js"></script>
<script type="text/javascript">
    // 将所有.ui-choose实例化
    $('.ui-choose').ui_choose();
    // uc_01 ul 单选
    var uc_01 = $('#uc_01').data('ui-choose'); // 取回已实例化的对象
    uc_01.click = function (index, item) {
        console.log('click', index, item.text())
    }
    uc_01.change = function (index, item) {
        console.log('change', index, item.text())
    }
    $(function () {
        $('#uc_01 li:eq(3)').click(function () {
            $('.tr_rechoth').show();
            $('.tr_rechoth').find("input").attr('required', 'true')
            $('.rechnum').text('0.00元');
        })

        $('#uc_01 li:eq(0)').click(function () {
            $('.tr_rechoth').hide();
            $('.rechnum').text('500.00元');
            $('.othbox').val('');
        })
        $('#uc_01 li:eq(1)').click(function () {
            $('.tr_rechoth').hide();
            $('.rechnum').text('1000.00元');
            $('.othbox').val('');
        })
        $('#uc_01 li:eq(2)').click(function () {
            $('.tr_rechoth').hide();
            $('.rechnum').text('3000.00元');
            $('.othbox').val('');
        })
        $(document).ready(function () {
            $('.othbox').on('input propertychange', function () {
                var num = $(this).val();
                $('.rechnum').html(num + ".00元");
            });
        });
    })
</script>
<%@ include file="../common/footer.jsp" %>

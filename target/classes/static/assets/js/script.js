/*
* 注册提交
* */
function submitRegister() {
    $.ajax({
        type: "POST",
        url: "/register/submit",
        async: false,
        data: $("#registerForm").serialize(),
        success: function (data) {
            swal(data.msg)
            if (data.code == 1) { //如果成功，前往更新资料
                window.location.href = "/admin/profile";
            }
        }
    });

}

/*
* 登录提交
* */
function submitLogin() {
    $.ajax({
        type: "POST",
        url: "/login/submit",
        async: false,
        data: $("#loginForm").serialize(),
        success: function (data) {
            swal(data.msg)
            if (data.code == 1) { //如果成功，刷新页面
                window.location.reload();
            }
        }
    });
}


/*
* 房屋信息保存
* */
function submitHouse() {
    $.ajax({
        type: "POST",
        url: "/admin/house/publish/submit",
        async: false,
        data: $("#houseForm").serialize(),
        success: function (data) {
            swal(data.msg)
            if (data.code == 1) { //如果成功，刷新页面
                window.location.href = "/admin/house";
            }
        }
    });

}

/*
* 下架房屋
* */
function downHouse(id) {
    $.ajax({
        type: "POST",
        url: "/admin/house/down",
        async: false,
        data: {
            "id": id
        },
        success: function (data) {
            swal(data.msg)
            if (data.code == 1) { //如果成功，刷新页面
                window.location.reload = "/admin/house";
            }
        }
    });
}

/*
* 上架房屋
* */
function upHouse(id) {
    $.ajax({
        type: "POST",
        url: "/admin/house/up",
        async: false,
        data: {
            "id": id
        },
        success: function (data) {
            swal(data.msg)
            if (data.code == 1) { //如果成功，刷新页面
                window.location.reload = "/admin/house";
            }
        }
    });
}


/*
* 房屋审核通过
* */
function checkPassHouse(id) {
    $.ajax({
        type: "POST",
        url: "/admin/house/checkPass",
        async: false,
        data: {
            "id": id
        },
        success: function (data) {
            swal(data.msg)
            if (data.code == 1) { //如果成功，刷新页面
                window.location.reload();
            }
        }
    });
}

/*
* 房屋审核驳回
* */
function checkRejectHouse(id) {
    $.ajax({
        type: "POST",
        url: "/admin/house/checkReject",
        async: false,
        data: {
            "id": id
        },
        success: function (data) {
            swal(data.msg)
            if (data.code == 1) { //如果成功，刷新页面
                window.location.reload();
            }
        }
    });
}


/*
* 删除房屋
* */
function deleteHouse(id) {
    $.ajax({
        type: "POST",
        url: "/admin/house/delete",
        async: false,
        data: {
            "id": id
        },
        success: function (data) {
            swal(data.msg)
            if (data.code == 1) { //如果成功，刷新页面
                window.location.reload();
            }
        }
    });
}

/*
* 收藏房屋提交
* */
function submitMark(id) {
    $.ajax({
        type: "POST",
        url: "/mark/submit",
        async: false,
        data: {
            "houseId": id
        },
        success: function (data) {
            swal(data.msg)
            if (data.msg == "请先登录") {
                window.location.href = "/";
            }
        }
    });
}

/*
* 创建房屋订单
* */
function createOrder() {
    var houseId = $("#houseId").val();
    var endDate = $("#endDate").val();
    $.ajax({
        type: "POST",
        url: "/order/create",
        async: false,
        data: {
            "houseId": houseId,
            "endDate": endDate
        },
        success: function (data) {
            swal(data.msg)
            if (data.msg == "请先登录") {
                window.location.href = "/";
            }
            //如果创建成功，跳转到签订合同页面。
            if (data.code == 1) {
                window.location.href = "/order/agreement/view?orderId=" + data.result;
            }
        }
    });
}

/*
* 完成签订合同步骤
* */
function confirmAgreement(orderId) {
    $.ajax({
        type: "POST",
        url: "/order/agreement/submit",
        async: false,
        data: {
            "orderId": orderId
        },
        success: function (data) {
            swal(data.msg)
            if (data.msg == "请先登录") {
                window.location.href = "/";
            }
            //如果创建成功，跳转到支付页面。
            if (data.code == 1) {
                window.location.href = "/order/pay?orderId=" + data.result;
            }
        }
    });
}


/*
* 模拟支付成功
* */
function submitPay(orderId, payMethod) {
    $.ajax({
        type: "POST",
        url: "/order/pay/submit",
        async: false,
        data: {
            "orderId": orderId,
            "payMethod": payMethod
        },
        success: function (data) {
            swal(data.msg)
            if (data.msg == "请先登录") {
                window.location.href = "/";
            }
            //如果支付成功，跳转到我的家页面。
            if (data.code == 1) {
                window.location.href = "/admin/home";
            }
        }
    });
}


/*
* 发送邮件联系房东
* */
function submitContact() {
    $.ajax({
        type: "POST",
        url: "/house/contact",
        async: false,
        data: $('#contactForm').serialize(),
        success: function (data) {
            swal(data.msg)
            if (data.msg == "请先登录") {
                window.location.href = "/";
            }
            //如果发送成功，刷新当前页面
            if (data.code == 1) {
                window.location.reload();
            }
        }
    });
}

/*个人信息保存*/
function submitProfile() {
    sessionStorage.length
    $.ajax({
        type: "POST",
        url: "/admin/profile/submit",
        async: false,
        data: $('#profileForm').serialize(),
        success: function (data) {
            swal(data.msg)
            //如果更新，刷新当前页面
            if (data.code == 1) {
                window.location.reload();
            }
        }
    });
}

/*取消订单*/
function cancelOrder(orderId) {
    $.ajax({
        type: "POST",
        url: "/admin/order/cancel",
        async: false,
        data: {
            'orderId': orderId
        },
        success: function (data) {
            swal(data.msg)
            //如果更新，刷新当前页面
            if (data.code == 1) {
                window.location.reload();
            }
        }
    });
}


/*申请退租*/
function endOrder(orderId) {
    $.ajax({
        type: "POST",
        url: "/admin/order/end",
        async: false,
        data: {
            'orderId': orderId
        },
        success: function (data) {
            swal(data.msg)
            //如果更新，刷新当前页面
            if (data.code == 1) {
                window.location.reload();
            }
        }
    });
}


/*退租申请 通过*/
function endOrderPass(orderId) {
    $.ajax({
        type: "POST",
        url: "/admin/order/endPass",
        async: false,
        data: {
            'orderId': orderId
        },
        success: function (data) {
            swal(data.msg)
            //如果更新，刷新当前页面
            if (data.code == 1) {
                window.location.reload();
            }
        }
    });
}


/*退租申请 拒绝*/
function endOrderReject(orderId) {
    $.ajax({
        type: "POST",
        url: "/admin/order/endReject",
        async: false,
        data: {
            'orderId': orderId
        },
        success: function (data) {
            swal(data.msg)
            //如果更新，刷新当前页面
            if (data.code == 1) {
                window.location.reload();
            }
        }
    });
}


/*取消收藏功能*/
function cancelMark(id) {
    $.ajax({
        type: "POST",
        url: "/admin/mark/cancel",
        async: false,
        data: {
            'id': id
        },
        success: function (data) {
            swal(data.msg)
            //如果更新，刷新当前页面
            if (data.code == 1) {
                window.location.reload();
            }
        }
    });
}


/*删除新闻功能*/
function deleteNews(id) {
    $.ajax({
        type: "POST",
        url: "/admin/news/delete",
        async: false,
        data: {
            'id': id
        },
        success: function (data) {
            swal(data.msg)
            //如果更新，刷新当前页面
            if (data.code == 1) {
                window.location.reload();
            }
        }
    });
}


/*
* 房屋信息保存
* */
function submitNews() {
    $.ajax({
        type: "POST",
        url: "/admin/news/publish/submit",
        async: false,
        data: $("#newsForm").serialize(),
        success: function (data) {
            swal(data.msg)
            if (data.code == 1) { //如果成功，刷新页面
                window.location.href = "/admin/news";
            }
        }
    });
}


/*
* 提交用户反馈
* */
function submitFeedback() {
    $.ajax({
        type: "POST",
        url: "/feedback/submit",
        async: false,
        data: $("#feedbackForm").serialize(),
        success: function (data) {
            swal(data.msg)
            if (data.code == 1) { //如果成功，刷新页面
                window.location.reload();
            }
        }
    });
}

/*
* 给回复提交的ID赋值
* */
function showReplyModal(id) {
    $("#feedbackId").val(id);
}

/*
* 回复反馈
* */
function feedbackReplySumbit() {
    $.ajax({
        type: "POST",
        url: "/admin/feedback/reply/submit",
        async: false,
        data: $("#feedbackForm").serialize(),
        success: function (data) {
            swal(data.msg)
            if (data.code == 1) { //如果成功，刷新页面
                window.location.reload();
            }
        }
    });
}


/*删除反馈*/
function deleteFeedback(id) {
    $.ajax({
        type: "POST",
        url: "/admin/feedback/delete",
        async: false,
        data: {
            'id': id
        },
        success: function (data) {
            swal(data.msg)
            //如果更新，刷新当前页面
            if (data.code == 1) {
                window.location.reload();
            }
        }
    });
}


/*禁用用户*/
function disableUser(id) {
    $.ajax({
        type: "POST",
        url: "/admin/user/disable",
        async: false,
        data: {
            'id': id
        },
        success: function (data) {
            swal(data.msg)
            //如果更新，刷新当前页面
            if (data.code == 1) {
                window.location.reload();
            }
        }
    });
}


/*启用用户*/
function enableUser(id) {
    $.ajax({
        type: "POST",
        url: "/admin/user/enable",
        async: false,
        data: {
            'id': id
        },
        success: function (data) {
            swal(data.msg)
            //如果更新，刷新当前页面
            if (data.code == 1) {
                window.location.reload();
            }
        }
    });
}


/*
* 修改密码
* */
function submitPassword() {
    $.ajax({
        type: "POST",
        url: "/admin/password/submit",
        async: false,
        data: $("#passwordForm").serialize(),
        success: function (data) {
            swal(data.msg)
            if (data.code == 1) { //如果成功，刷新页面
                window.location.reload();
            }
        }
    });
}

/*
* REDEEM 兑换充值卡 充值到用户账号余额
* */
function redeemGiftCard() {
    $.ajax({
        type: "POST",
        url: "/admin/giftcard/redeem",
        async: false,
        data: $("#giftcardForm").serialize(),
        success: function (data) {
            swal(data.msg)
            if (data.code == 1) { //如果成功，刷新页面
                window.location.reload();
            }
        }
    });
}

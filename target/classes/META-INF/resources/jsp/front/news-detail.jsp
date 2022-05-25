<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/head.jsp" %>
<div class="image-cover hero_banner" style="background: #334ACA url('/assets/img/news-img.jpg') no-repeat;"
     data-overlay="1">
    <div class="container">
        <h1 class="big-header-capt mb-0">${news.title}</h1>
        <p class="text-center mb-5">${news.author} - <fmt:formatDate value="${news.createTime}"
                                                                     pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></p>
    </div>
</div>
<section class="gray-simple">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="article_detail_wrapss single_article_wrap">
                    <div class="article_body_wrap">
                        <h4 style="margin-top: 10px;">${news.title}</h4>
                        <div class="article_top_info">
                            <ul class="article_middle_info">
                                <li><span class="icons"><i class="ti-user"></i></span>${news.author}</li>
                                <li><fmt:formatDate value="${news.createTime}"
                                                    pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></li>
                            </ul>
                        </div>
                        <div style="margin-top: 5px;">${news.content}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%@ include file="../common/footer.jsp" %>


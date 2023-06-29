<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>







<!doctype html>
<html lang="en">
<head>
<base href="/" />
<meta charset="utf-8" />
<meta name="viewport" content="initial-scale=1, maximum-scale=1, minimum-scale=1">
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet" type="text/css" href="assets/css/main.css">
</head>
<body class="loaded">
	<div class="load-icon"></div>
	<div class="page-container">
		
		

    <!-- BEGIN LOGIN -->
    <div class="login-page">
        <div class="login-page__all">
            <div class="login-page__banner" data-bg="assets/img/login-bg.jpg"></div>
            <div class="login-page__main">
                <form action="login" method="post">
                    <div class="login-form">
                        <div class="login-form__top">
                            <h2 class="login-form__title">LOGIN FOR ADMIN </h2>
                            <p class="login-form__text">.</p>
                        </div>
                        
                        <c:if test="${not empty message}">
							<div style="margin-top:20px;color:red;text-align:center">${message}</div>
						</c:if>
						<h3 style="color: red">${err}</h3>
	                    <span class="login-form__label">Tài khoản</span>
	                    
                        <input class="text-input" type="text" name="username" placeholder="Nhập tài khoản" required>
	                    <span class="login-form__label">Mật khẩu</span>
                        <input class="text-input" type="password" name="password" placeholder="Nhập mật khẩu" required>
                        
                        <div class="login-form__bottom">
                            <div class="login-form__col">
                                <div class="login-form__checkbox checkbox">
                                    <label class="checkbox__label">
                                        <input class="checkbox__input" type="checkbox" name="remember" value="true">
                                        <span class="checkbox__icon"></span>
                                        <span class="checkbox__text">Ghi nhớ?</span>
                                    </label>
                                </div>                                        
                            </div>
                            <div class="login-form__col">
                                <span class="login-form__small-text">
                                    <a href="forgot-password">Quên mật khẩu?</a>
                                </span>
                            </div>                                    
                        </div>
                        <button class="login-form__button button" type="submit">
                            <span class="button__text">Đăng nhập</span>
                        </button>
		                
                </form>
                <img class="login-page__vector" data-lazy="assets/img/svg/vector-login.svg">
            </div>
        </div>
    </div>
    <!-- LOGIN END -->
</main>
<!-- MAIN END -->



</footer>
<!-- FOOTER END -->
</div>
<script src="assets/js/libs/jquery-3.3.1.slim.min.js"></script>
<script src="assets/js/components/bootstrap.min.js"></script>
<script src="assets/js/libs/jquery-3.5.1.min.js"></script>
<script src="assets/js/libs/jquery-migrate-1.4.1.min.js"></script>
<script src="assets/js/components/slick.js"></script>
<script src="assets/js/components/formstyler.js"></script>
<script src="assets/js/components/rating.js"></script>
<script src="assets/js/components/wnumb.js"></script>
<script src="assets/js/components/nouislider.js"></script>
<script src="assets/js/components/fancybox.js"></script>
<script src="assets/js/components/syotimer.js"></script>
<script src="assets/js/main.js"></script>
</body>
</html>
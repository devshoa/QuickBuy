<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<main class="main">
    <!-- BEGIN INNER TOP -->


    <!-- BEGIN LOGIN -->
    <div class="login-page">
       
           
            <div class="login-page__main">
                <form action="forgot-password" method="post">
                    <div class="login-form">
                        <div class="login-form__top">
                            <h2 class="login-form__title">Quên mật khẩu</h2>
                            <p class="login-form__text">Vui lòng nhập tên người dùng của bạn để chúng tôi có thể gửi một email có mật khẩu mới đến bạn.</p>
                        </div>
	                    <span class="login-form__label">Địa chỉ email</span>
                        <input class="text-input" type="text" name="email" placeholder="" required>
                        <button class="login-form__button button" type="submit">
                            <span class="button__text">Gửi</span>
                        </button>
						<c:if test="${not empty message}">
							<div style="margin-top:20px;color:red;text-align:center">${message}</div>
						</c:if>
                    </div>
                </form>
               
            </div>
       
    </div>
    <!-- LOGIN END -->
</main>

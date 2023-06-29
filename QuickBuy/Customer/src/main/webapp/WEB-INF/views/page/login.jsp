<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="images/favicon.png" rel="shortcut icon">
<title>QuickBuy - Đăng Nhập</title>

<!--====== Google Font ======-->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800"
	rel="stylesheet">

<!--====== Vendor Css ======-->
<link rel="stylesheet" href="css/vendor.css">

<!--====== Utility-Spacing ======-->
<link rel="stylesheet" href="css/utility.css">

<!--====== App ======-->
<link rel="stylesheet" href="css/app.css">
</head>
<body class="config">
	<div class="preloader is-active">
		<div class="preloader__wrap">

			<img class="preloader__img" src="images/preloader.png" alt="">
		</div>
	</div>

	<!--====== Main App ======-->
	<div id="app">

		<!--====== Header ======-->
		<jsp:include page="../share_page/header.jsp"></jsp:include>


		<!--====== App Content ======-->
		<div class="app-content" style="margin-top: 150px">

			<!--====== Section 1 ======-->
			<div class="u-s-p-y-60">

				<!--====== Section Content ======-->
				<div class="section__content">
					<div class="container">
						<div class="breadcrumb">
							<div class="breadcrumb__wrap">
								<ul class="breadcrumb__list">
									<li class="has-separator"><a href="/">Trang chủ</a></li>
									<li class="is-marked"><a href="signin">Đăng Nhập</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--====== End - Section 1 ======-->


			<!--====== Section 2 ======-->
			<div class="u-s-p-b-60">

				<!--====== Section Intro ======-->
				<div class="section__intro u-s-m-b-60">
					<div class="container">
						<div class="row">
							<div class="col-lg-12">
								<div class="section__text-wrap">
									<h1 class="section__heading u-c-secondary">ĐĂNG NHẬP</h1>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--====== End - Section Intro ======-->


				<!--====== Section Content ======-->
				<div class="section__content">
					<div class="container">
						<div class="row row--center">
							<div class="col-lg-6 col-md-8 u-s-m-b-30">
								<div class="l-f-o">
									<div class="l-f-o__pad-box">
										<h1 class="gl-h1">KHÁCH HÀNG MỚI</h1>

										<span class="gl-text u-s-m-b-30">Bằng cách tạo tài
											khoản với cửa hàng của chúng tôi, bạn sẽ có thể chuyển qua
											quy trình thanh toán nhanh hơn, lưu trữ địa chỉ giao hàng,
											xem và theo dõi đơn đặt hàng trong tài khoản của bạn, v.v.</span>
										<div class="u-s-m-b-15">

											<a class="l-f-o__create-link btn--e-transparent-brand-b-2"
												href="signup">TẠO MỘT TÀI KHOẢN</a>
										</div>
										<h1 class="gl-h1">ĐĂNG NHẬP</h1>

										<c:if test="${err != null}">
											<span class="gl-text u-s-m-b-30">${err} <a href="lost-password"
												style="color: #ff4500; cursor: pointer;">. Kích hoạt tài khoản này?</a></span>
										</c:if>

										<form:form action="do-login" class="l-f-o__form" method="post"
											modelAttribute="loginDto">

											<div class="u-s-m-b-30">

												<label class="gl-label" for="login-email">TÊN ĐĂNG
													NHẬP *</label>
												<form:input path="userName" value="${userName}"
													class="input-text input-text--primary-style" type="text"
													id="login-email" placeholder="Tên đăng nhập" />
												<form:errors style="color:red; font-size: 13px"
													path="userName" />
											</div>
											<div class="u-s-m-b-30">

												<label class="gl-label" for="login-password">MẬT
													KHẨU *</label>
												<form:input path="password" value="${passw}"
													class="input-text input-text--primary-style"
													type="password" id="login-password"
													placeholder="Mật khẩu" />
												<form:errors style="color:red; font-size: 13px"
													path="password" />
												<span style="color: red; font-size: 13px">${errpass}</span>
											</div>
											<div class="gl-inline">
												<div class="u-s-m-b-30">

													<button class="btn btn--e-transparent-brand-b-2"
														type="submit">ĐĂNG NHẬP</button>
												</div>
												<div class="u-s-m-b-30">

													<a class="gl-link" href="lost-password">Quên mật khẩu</a>
												</div>
											</div>
											<div class="u-s-m-b-30">

												<!--====== Check Box ======-->
												<div class="check-box">

													<input type="checkbox" id="remember-me">
													<div class="check-box__state check-box__state--primary">

														<label class="check-box__label" for="remember-me">Ghi
															nhớ tôi</label>
													</div>
												</div>
												<!--====== End - Check Box ======-->
											</div>
										</form:form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--====== End - Section Content ======-->
			</div>
			<!--====== End - Section 2 ======-->
		</div>
		<!--====== End - App Content ======-->


		<!--====== Footer ======-->
		<jsp:include page="../share_page/footer.jsp"></jsp:include>


	</div>
	<!--====== End - Main App ======-->


	<!--====== Google Analytics: change UA-XXXXX-Y to be your site's ID ======-->
	<script>
		window.ga = function() {
			ga.q.push(arguments)
		};
		ga.q = [];
		ga.l = +new Date;
		ga('create', 'UA-XXXXX-Y', 'auto');
		ga('send', 'pageview')
	</script>
	<script src="https://www.google-analytics.com/analytics.js" async defer></script>

	<!--====== Vendor Js ======-->
	<script src="js/vendor.js"></script>

	<!--====== jQuery Shopnav plugin ======-->
	<script src="js/jquery.shopnav.js"></script>

	<!--====== App ======-->
	<script src="js/app.js"></script>

	<!--====== Noscript ======-->
	<noscript>
		<div class="app-setting">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="app-setting__wrap">
							<h1 class="app-setting__h1">JavaScript is disabled in your
								browser.</h1>

							<span class="app-setting__text">Please enable JavaScript
								in your browser or upgrade to a JavaScript-capable browser.</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</noscript>
</body>
</html>
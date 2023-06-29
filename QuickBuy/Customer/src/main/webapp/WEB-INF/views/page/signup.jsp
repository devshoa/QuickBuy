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

		<jsp:include page="../share_page/header.jsp"></jsp:include>


		<!--====== App Content ======-->
		<div class="app-content">

			<!--====== Section 1 ======-->
			<div class="u-s-p-y-60">

				<!--====== Section Content ======-->
				<div class="section__content">
					<div class="container">
						<div class="breadcrumb">
							<div class="breadcrumb__wrap">
								<ul class="breadcrumb__list">
									<li class="has-separator"><a href="index.html">Trang
											chủ</a></li>
									<li class="is-marked"><a href="signup">Đăng ký</a></li>
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
									<h1 class="section__heading u-c-secondary">TẠO MỘT TÀI
										KHOẢN</h1>
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
										<form:form action="do-signup" method="post"
											modelAttribute="customerDto" class="l-f-o__form">

												<div class="u-s-m-b-30">

													<label class="gl-label" for="reg-address">HỌ VÀ
														TÊN *</label>
													<form:input path="customerName"
														class="input-text input-text--primary-style" type="text"
														id="reg-address" placeholder="Họ và tên" />
													<form:errors style="color:red; font-size: 13px"
														path="customerName" />
												</div>
												<div class="u-s-m-b-30">

													<label class="gl-label" for="reg-address">ĐỊA CHỈ
														*</label>
													<form:input path="address"
														class="input-text input-text--primary-style" type="text"
														id="reg-address" placeholder="Địa chỉ" />
													<form:errors style="color:red; font-size: 13px"
														path="address" />
												</div>
												<div class="u-s-m-b-30">
													<label class="gl-label" for="reg-email">E-MAIL *</label>
													<form:input path="email"
														class="input-text input-text--primary-style" type="text"
														id="reg-email" placeholder="Email" />
													<form:errors style="color:red; font-size: 13px"
														path="email" />
													<span style="color: red; font-size: 13px">${emailerr}</span>
												</div>
												<div class="u-s-m-b-30">
													<label class="gl-label" for="reg-phone">SỐ ĐIỆN
														THOẠI *</label>
													<form:input path="phone"
														class="input-text input-text--primary-style" type="tel"
														id="reg-phone" placeholder="Số điện thoại" />
													<form:errors style="color:red; font-size: 13px"
														path="phone" />
												</div>
												<div class="u-s-m-b-30">
													<label class="gl-label" for="reg-username">TÊN ĐĂNG
														NHẬP *</label>
													<form:input path="userName" id="reg-username"
														class="input-text input-text--primary-style" type="text"
														placeholder="Tên đăng nhập" />
													<form:errors style="color:red; font-size: 13px"
														path="userName" />
													<span style="color: red; font-size: 13px">${usererr}</span>
												</div>
												<div class="u-s-m-b-30">
													<label class="gl-label" for="reg-password">MẬT
														KHẨU *</label>
													<form:input path="password"
														class="input-text input-text--primary-style"
														type="password" id="reg-password" placeholder="Mật khẩu" />
													<form:errors style="color:red; font-size: 13px"
														path="password" />
												</div>
												<div class="u-s-m-b-30">
													<label class="gl-label" for="reg-cpassword">XÁC
														NHẬN MẬT KHẨU *</label>
													<form:input path="confirmPassword"
														class="input-text input-text--primary-style"
														type="password" id="reg-cpassword"
														placeholder="Xác nhận mật khẩu" />
													<span style="color: red; font-size: 13px">${passErr}</span>
												</div>
												<div class="u-s-m-b-15">

													<button class="btn btn--e-transparent-brand-b-2"
														type="submit">TẠO</button>
												</div>

												<a class="gl-link" href="/">Quay lại trang chủ</a>

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


		<!--====== Main Footer ======-->
		<footer>
			<div class="outer-footer">
				<div class="container">
					<div class="row">
						<div class="col-lg-4 col-md-6">
							<div class="outer-footer__content u-s-m-b-40">

								<span class="outer-footer__content-title">Contact Us</span>
								<div class="outer-footer__text-wrap">
									<i class="fas fa-home"></i> <span>4247 Ashford Drive
										Virginia VA-20006 USA</span>
								</div>
								<div class="outer-footer__text-wrap">
									<i class="fas fa-phone-volume"></i> <span>(+0) 900 901
										904</span>
								</div>
								<div class="outer-footer__text-wrap">
									<i class="far fa-envelope"></i> <span>contact@domain.com</span>
								</div>
								<div class="outer-footer__social">
									<ul>
										<li><a class="s-fb--color-hover" href="#"><i
												class="fab fa-facebook-f"></i></a></li>
										<li><a class="s-tw--color-hover" href="#"><i
												class="fab fa-twitter"></i></a></li>
										<li><a class="s-youtube--color-hover" href="#"><i
												class="fab fa-youtube"></i></a></li>
										<li><a class="s-insta--color-hover" href="#"><i
												class="fab fa-instagram"></i></a></li>
										<li><a class="s-gplus--color-hover" href="#"><i
												class="fab fa-google-plus-g"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="row">
								<div class="col-lg-6 col-md-6">
									<div class="outer-footer__content u-s-m-b-40">

										<span class="outer-footer__content-title">Information</span>
										<div class="outer-footer__list-wrap">
											<ul>
												<li><a href="cart.html">Cart</a></li>
												<li><a href="dashboard.html">Account</a></li>
												<li><a href="shop-side-version-2.html">Manufacturer</a></li>
												<li><a href="dash-payment-option.html">Finance</a></li>
												<li><a href="shop-side-version-2.html">Shop</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div class="col-lg-6 col-md-6">
									<div class="outer-footer__content u-s-m-b-40">
										<div class="outer-footer__list-wrap">

											<span class="outer-footer__content-title">Our Company</span>
											<ul>
												<li><a href="about.html">About us</a></li>
												<li><a href="contact.html">Contact Us</a></li>
												<li><a href="index.html">Sitemap</a></li>
												<li><a href="dash-my-order.html">Delivery</a></li>
												<li><a href="shop-side-version-2.html">Store</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-12">
							<div class="outer-footer__content">

								<span class="outer-footer__content-title">Join our
									Newsletter</span>
								<form class="newsletter">
									<div class="u-s-m-b-15">
										<div class="radio-box newsletter__radio">

											<input type="radio" id="male" name="gender">
											<div class="radio-box__state radio-box__state--primary">

												<label class="radio-box__label" for="male">Male</label>
											</div>
										</div>
										<div class="radio-box newsletter__radio">

											<input type="radio" id="female" name="gender">
											<div class="radio-box__state radio-box__state--primary">

												<label class="radio-box__label" for="female">Female</label>
											</div>
										</div>
									</div>
									<div class="newsletter__group">

										<label for="newsletter"></label> <input
											class="input-text input-text--only-white" type="text"
											id="newsletter" placeholder="Enter your Email">

										<button class="btn btn--e-brand newsletter__btn" type="submit">SUBSCRIBE</button>
									</div>

									<span class="newsletter__text">Subscribe to the mailing
										list to receive updates on promotions, new arrivals, discount
										and coupons.</span>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="lower-footer">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="lower-footer__content">
								<div class="lower-footer__copyright">

									<span>Copyright © 2018</span> <a href="index.html">Reshop</a> <span>All
										Right Reserved</span>
								</div>
								<div class="lower-footer__payment">
									<ul>
										<li><i class="fab fa-cc-stripe"></i></li>
										<li><i class="fab fa-cc-paypal"></i></li>
										<li><i class="fab fa-cc-mastercard"></i></li>
										<li><i class="fab fa-cc-visa"></i></li>
										<li><i class="fab fa-cc-discover"></i></li>
										<li><i class="fab fa-cc-amex"></i></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>
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
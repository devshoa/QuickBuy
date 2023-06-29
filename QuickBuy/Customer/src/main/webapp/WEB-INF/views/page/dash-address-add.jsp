<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="images/favicon.png" rel="shortcut icon">
<title>Ludus - Thêm Địa Chỉ Mới</title>

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
		<div class="app-content">

			<!--====== Section 1 ======-->
			<div class="u-s-p-y-60">

				<!--====== Section Content ======-->
				<div class="section__content">
					<div class="container">
						<div class="breadcrumb">
							<div class="breadcrumb__wrap">
								<ul class="breadcrumb__list">
									<li class="has-separator"><a href="/">Trang chủ</a></li>
									<li class="is-marked"><a href="dash-address-add">Tài
											khoản của tôi</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--====== End - Section 1 ======-->


			<!--====== Section 2 ======-->
			<div class="u-s-p-b-60">

				<!--====== Section Content ======-->
				<div class="section__content">
					<div class="dash">
						<div class="container">
							<div class="row">
								<div class="col-lg-3 col-md-12">

									<!--====== Dashboard Features ======-->
									<jsp:include page="../share_page/dashboard.jsp"></jsp:include>
									<div
										class="dash__box dash__box--bg-white dash__box--shadow dash__box--w">
										<div class="dash__pad-1">
											<ul class="dash__w-list">
												<li>
													<div class="dash__w-wrap">

														<span class="dash__w-icon dash__w-icon-style-1"><i
															class="fas fa-cart-arrow-down"></i></span> <span
															class="dash__w-text">4</span> <span class="dash__w-name">Đặt
															hàng</span>
													</div>
												</li>
												<li>
													<div class="dash__w-wrap">

														<span class="dash__w-icon dash__w-icon-style-2"><i
															class="fas fa-times"></i></span> <span class="dash__w-text">0</span>

														<span class="dash__w-name">Hủy đơn hàng</span>
													</div>
												</li>
												<li>
													<div class="dash__w-wrap">

														<span class="dash__w-icon dash__w-icon-style-3"><i
															class="far fa-heart"></i></span> <span class="dash__w-text">0</span>

														<span class="dash__w-name">Danh sách yêu thích</span>
													</div>
												</li>
											</ul>
										</div>
									</div>
									<!--====== End - Dashboard Features ======-->


								</div>
								<div class="col-lg-9 col-md-12">
									<div
										class="dash__box dash__box--shadow dash__box--radius dash__box--bg-white">
										<div class="dash__pad-2">
											<h1 class="dash__h1 u-s-m-b-14">Thêm địa chỉ mới</h1>

											<span class="dash__text u-s-m-b-30">Chúng tôi cần một
												địa chỉ nơi chúng tôi có thể cung cấp sản phẩm.</span>
											<form class="dash-address-manipulation">
												<div class="gl-inline">
													<div class="u-s-m-b-30">

														<label class="gl-label" for="address-fname">TÊN *</label>

														<input class="input-text input-text--primary-style"
															type="text" id="address-fname" placeholder="Tên">
													</div>
													<div class="u-s-m-b-30">

														<label class="gl-label" for="address-lname">HỌ *</label>

														<input class="input-text input-text--primary-style"
															type="text" id="address-lname" placeholder="Họ">
													</div>
												</div>
												<div class="gl-inline">
													<div class="u-s-m-b-30">

														<label class="gl-label" for="address-phone">Số
															điện thoại *</label> <input
															class="input-text input-text--primary-style" type="text"
															id="address-phone">
													</div>
													<div class="u-s-m-b-30">

														<label class="gl-label" for="address-street">ĐỊA
															CHỈ *</label> <input
															class="input-text input-text--primary-style" type="text"
															id="address-street" placeholder="Địa chỉ chi tiết">
													</div>
												</div>
												<div class="gl-inline">

													<div class="u-s-m-b-30">

														<!--====== Select Box ======-->

														<label class="gl-label" for="address-state">TỈNH
															*</label><select class="select-box select-box--primary-style"
															id="address-state">
															<option selected value="">Chọn Tỉnh</option>
															<option value="al">Cần Thơ</option>
															<option value="al">Đồng Tháp</option>
															<option value="ny">Sóc Trăng</option>
														</select>
														<!--====== End - Select Box ======-->
													</div>
													<div class="u-s-m-b-30">

														<label class="gl-label" for="address-city">THỊ
															TRẤN/THÀNH PHỐ *</label> <input
															class="input-text input-text--primary-style" type="text"
															id="address-city">
													</div>
												</div>


												<button class="btn btn--e-brand-b-2" type="submit">LƯU</button>
											</form>
										</div>
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
												<li><a href="cart">Cart</a></li>
												<li><a href="dashboard">Account</a></li>
												<li><a href="shop-side-version-2">Manufacturer</a></li>
												<li><a href="dash-payment-option">Finance</a></li>
												<li><a href="shop-side-version-2">Shop</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div class="col-lg-6 col-md-6">
									<div class="outer-footer__content u-s-m-b-40">
										<div class="outer-footer__list-wrap">

											<span class="outer-footer__content-title">Our Company</span>
											<ul>
												<li><a href="about">About us</a></li>
												<li><a href="contact">Contact Us</a></li>
												<li><a href="/">Sitemap</a></li>
												<li><a href="dash-my-order">Delivery</a></li>
												<li><a href="shop-side-version-2">Store</a></li>
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

									<span>Copyright © 2018</span> <a href="/">Reshop</a> <span>All
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
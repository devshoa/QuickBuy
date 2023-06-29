<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="images/favicon.png" rel="shortcut icon">
<title>Ludus - Quản Lý Tài Khoản</title>

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
			<div class="u-s-p-y-60" style="margin-top: 120px">

				<!--====== Section Content ======-->
				<div class="section__content">
					<div class="container">
						<div class="breadcrumb">
							<div class="breadcrumb__wrap">
								<ul class="breadcrumb__list">
									<li class="has-separator"><a href="/">Trang chủ</a></li>
									<li class="is-marked"><a href="dashboard">Tài khoản
											của tôi</a></li>
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
									<!--====== End - Dashboard Features ======-->
								</div>
								<div class="col-lg-9 col-md-12">
									<div
										class="dash__box dash__box--shadow dash__box--radius dash__box--bg-white u-s-m-b-30">
										<div class="dash__pad-2">
											<h1 class="dash__h1 u-s-m-b-14">Quản lý tài khoản của
												tôi</h1>

											<span class="dash__text u-s-m-b-30">Từ Trang tổng quan
												tài khoản của tôi, bạn có thể xem ảnh chụp nhanh về hoạt
												động tài khoản gần đây của mình và cập nhật thông tin tài
												khoản của mình. Chọn một liên kết bên dưới để xem hoặc chỉnh
												sửa thông tin.</span>
											<div class="row">
												<div class="col-lg-4 u-s-m-b-30">
													<div
														class="dash__box dash__box--bg-grey dash__box--shadow-2 u-h-100">
														<div class="dash__pad-3">
															<h2 class="dash__h2 u-s-m-b-8">THÔNG TIN CÁ NHÂN</h2>
															<div class="dash__link dash__link--secondary u-s-m-b-8">

																<a href="dash-edit-profile">Chỉnh sửa</a>
															</div>

															<span class="dash__text">${customer.customerName}</span>
															<span class="dash__text">${customer.email}</span>
															<div style="margin-top: 30px">
																<a class="dash__custom-link btn--e-brand-b-2"
																	href="lost-password">Đặt Lại Mật Khẩu</a>
															</div>
														</div>
													</div>
												</div>
												<div class="col-lg-4 u-s-m-b-30">
													<div
														class="dash__box dash__box--bg-grey dash__box--shadow-2 u-h-100">
														<div class="dash__pad-3">
															<h2 class="dash__h2 u-s-m-b-8">ĐỊA CHỈ</h2>

															<span class="dash__text-2 u-s-m-b-8">Địa chỉ giao
																hàng mặc định</span>
															<div class="dash__link dash__link--secondary u-s-m-b-8">

																<a href="dash-address-book">Chỉnh sửa</a>
															</div>

															<span class="dash__text">${customer.address}</span>
														</div>
													</div>
												</div>
												<div class="col-lg-4 u-s-m-b-30">
													<div
														class="dash__box dash__box--bg-grey dash__box--shadow-2 u-h-100">
														<div class="dash__pad-3">
															<h2 class="dash__h2 u-s-m-b-8">ĐỊA CHỈ THANH TOÁN</h2>

															<span class="dash__text-2 u-s-m-b-8">Địa chỉ thanh
																toán mặc định</span> <span class="dash__text">${customer.address}</span>
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
				<!--====== End - Section Content ======-->
			</div>
			<!--====== End - Section 2 ======-->
		</div>
		<!--====== End - App Content ======-->


		<!--====== Footer ======-->
		<jsp:include page="../share_page/footer.jsp"></jsp:include>

		<!--====== Modal Section ======-->


		<!--====== Unsubscribe or Subscribe Newsletter ======-->
		<div class="modal fade" id="dash-newsletter">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content modal--shadow">
					<div class="modal-body">
						<form class="d-modal__form">
							<div class="u-s-m-b-15">
								<h1 class="gl-modal-h1">Đăng ký bảng tin</h1>

								<span class="gl-modal-text">Tôi đã đọc và hiểu</span> <a
									class="d_modal__link" href="dashboard">Chính sách bảo mật
									QuickBuy</a>
							</div>
							<div class="gl-modal-btn-group">

								<button class="btn btn--e-brand-b-2" type="submit">ĐẶT
									MUA</button>

								<button class="btn btn--e-grey-b-2" type="button"
									data-dismiss="modal">HỦY</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!--====== Unsubscribe or Subscribe Newsletter ======-->
		<!--====== End - Modal Section ======-->
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
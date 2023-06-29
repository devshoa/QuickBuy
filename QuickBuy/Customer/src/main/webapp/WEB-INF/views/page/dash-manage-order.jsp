<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="images/favicon.png" rel="shortcut icon">
<title>Ludus - Quản Lý Đơn Hàng</title>

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

		<!--====== Main Header ======-->
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
									<li class="has-separator"><a href="/">Trang Chủ</a></li>
									<li class="is-marked"><a href="dash-manage-order">Chi
											tiết đặt hàng</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--====== End - Section 1 ======-->


			<!--====== Section 2 ======-->
			<div class="u-s-p-b-60">
				<h1>${err}</h1>

				<!--====== Section Content ======-->
				<div class="section__content">
					<div class="dash">
						<div class="container">
							<div class="row">
								<div class="col-lg-3 col-md-12">

									<!--====== Dashboard Features ======-->
									<jsp:include page="../share_page/dashboard.jsp"></jsp:include>

								</div>
								<div class="col-lg-9 col-md-12">
									<h1 class="dash__h1 u-s-m-b-30">Chi tiết đặt hàng</h1>
									<div
										class="dash__box dash__box--shadow dash__box--radius dash__box--bg-white u-s-m-b-30">
										<div class="dash__pad-2">
											<div class="dash-l-r">
												<div>
												
													<div class="manage-o__text-2 u-c-secondary">Mã Đơn
														Hàng #${orderhistory.order.orderID}</div>
													<div class="manage-o__text u-c-silver">Đặt vào
														ngày: ${orderhistory.order.orderDate}</div>
												</div>
												<div>
													<div class="manage-o__text-2 u-c-silver">
														Tổng Cộng: <span class="manage-o__text-2 u-c-secondary">${orderhistory.order.totalMoneyFormat}
															</span>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div
										class="dash__box dash__box--shadow dash__box--radius dash__box--bg-white u-s-m-b-30">
										<div class="dash__pad-2">
											<div class="manage-o">
												<div class="manage-o__header u-s-m-b-30">
													<div class="manage-o__icon">
														<i class="fas fa-box u-s-m-r-5"></i> <span
															class="manage-o__text">Gói 1</span>
													</div>
												</div>
												<div class="dash-l-r" style="margin-bottom: 30px">
													<div class="manage-o__text u-c-secondary">${orderhistory.orderStatus.orderStatusName}</div>
													<div class="manage-o__icon">
														<i class="fas fa-truck u-s-m-r-5"></i> <span
															class="manage-o__text">Tiêu chuẩn</span>
													</div>
												</div>

												<div class="manage-o__description">
													<div class="description__container">
														<div class="description__img-wrap">

															<img class="u-img-fluid"
																src="${orderdetails.product.image}" alt="">
														</div>
														<div class="description-title">${orderdetails.product.productName}</div>
													</div>
													<div class="description__info-wrap">
														<div>

															<span class="manage-o__text-2 u-c-silver">Số
																lượng: <span class="manage-o__text-2 u-c-secondary">${orderdetails.quantity}</span>
															</span>
														</div>
														<div>

															<span class="manage-o__text-2 u-c-silver">Tổng: <span
																class="manage-o__text-2 u-c-secondary">${orderdetails.order.totalMoneyFormat}
																	</span></span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-6">
											<div
												class="dash__box dash__box--bg-white dash__box--shadow u-s-m-b-30">
												<div class="dash__pad-3">
													<h2 class="dash__h2 u-s-m-b-8">Địa Chỉ Giao Hàng</h2>
													<h2 class="dash__h2 u-s-m-b-8">${orderdetails.order.customer.customerName}</h2>

													<span class="dash__text-2">${orderdetails.order.customer.address }</span>

													<span class="dash__text-2">${orderdetails.order.customer.phone}</span>
												</div>
											</div>
										</div>
										<div class="col-lg-6">
											<div
												class="dash__box dash__box--bg-white dash__box--shadow u-h-100">
												<div class="dash__pad-3">
													<h2 class="dash__h2 u-s-m-b-8">Tổng Tóm Tắt</h2>
													<div class="dash-l-r u-s-m-b-8">
														<div class="manage-o__text-2 u-c-secondary">Tổng
															Phụ</div>
													</div>
													<div class="dash-l-r u-s-m-b-8">
														<div class="manage-o__text-2 u-c-secondary">Phí
															Vận Chuyển</div>
														<div class="manage-o__text-2 u-c-secondary">0 VNĐ</div>
													</div>
													<div class="dash-l-r u-s-m-b-8">
														<div class="manage-o__text-2 u-c-secondary">Tổng
															Cộng</div>
														<div class="manage-o__text-2 u-c-secondary">${orderhistory.order.totalMoneyFormat}
															</div>
													</div>


													<div class="manage-o__text-2 u-c-secondary">${orderhistory.order.paymentMethod.paymentName}</div>

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
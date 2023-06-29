<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="images/favicon.png" rel="shortcut icon">
<title>Ludus - Electronics, Apparel, Computers, Books, DVDs &
	more</title>

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
									<li class="has-separator"><a href="index">Trang chủ</a></li>
									<li class="is-marked"><a href="dash-my-order">Đơn
											hàng của tôi</a></li>
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
											<h1 class="dash__h1 u-s-m-b-14">Đơn hàng của tôi</h1>

											<div class="m-order__list">

												<c:forEach items="${orderDetails}" var="orderDetail">
													<div class="m-order__get">
														<div class="manage-o__header u-s-m-b-30">
															<div class="dash-l-r">
																<div>
																	<div class="manage-o__text-2 u-c-secondary">Mã
																		đơn hàng ${orderDetail.order.orderID}</div>
																	<div class="manage-o__text u-c-silver">Đặt ngày
																		hàng ${orderDetail.order.orderDate}</div>
																</div>
																<div>
																	<div class="dash__link dash__link--brand">

																		<a href="dash-manage-order?orderid=${orderDetail.order.orderID}"
																			style="border: none; background: none; font-size: 15px; cursor: pointer; font-weight: 600">QUẢN
																			LÝ</a>

																	</div>
																</div>
															</div>
														</div>
														<div class="manage-o__description">
															<div class="description__container">
																<div class="description__img-wrap">
																	<img class="u-img-fluid"
																		src="${orderDetail.product.image}" alt="">
																</div>
																<div class="description-title">${orderDetail.product.productName}</div>
															</div>
															<div class="description__info-wrap">

																<div>

																	<span class="manage-o__text-2 u-c-silver">Số
																		lượng: <span class="manage-o__text-2 u-c-secondary">${orderDetail.quantity}</span>
																	</span>
																</div>
																<div>

																	<span class="manage-o__text-2 u-c-silver">Tổng
																		tiền: <span class="manage-o__text-2 u-c-secondary">${orderDetail.order.totalMoneyFormat}
																			</span>
																	</span>
																</div>
															</div>
														</div>
													</div>
												</c:forEach>

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


		<!--====== Main Footer ======-->
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

</body>

</html>
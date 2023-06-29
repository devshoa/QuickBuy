<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="images/favicon.png" rel="shortcut icon">
<title>QuickBuy - Thủ Tục Thanh Toán</title>

<!--====== Google Font ======-->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
									<li class="is-marked"><a href="checkout">Thủ tục
											thanh toán</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--====== End - Section 1 ======-->


			<!--====== Section 3 ======-->
			<div class="u-s-p-b-60">

				<!--====== Section Content ======-->
				<form class="checkout-f__payment"
					action="checkout/${totalsUSD}/${noFormat}/${quantitys}" method="post">

					<div class="section__content">
						<div class="container">
							<div class="checkout-f">
								<div class="row">
									<div class="col">
										<h1 class="checkout-f__h1">SẢN PHẨM</h1>

										<!--====== Order Summary ======-->
										<div class="o-summary">
											<div class="o-summary__section u-s-m-b-30">
												<div class="o-summary__item-wrap gl-scroll">
													<c:forEach items="${shoppingCarts}" var="shoppingCart">
														<div class="o-card">
															<div class="o-card__flex">
																<div class="o-card__img-wrap">

																	<img class="u-img-fluid"
																		src="${shoppingCart.product.image}" alt="">
																</div>
																<div class="o-card__info-wrap">

																	<span class="o-card__name"> <a
																		href="product-detail?product-id=${shoppingCart.product.productID}">${shoppingCart.product.productName}</a></span>
																	<span class="o-card__quantity">Số lượng:
																		${shoppingCart.quantity}</span> <span
																		class="o-card__quantity">Kích thước:
																		${shoppingCart.productSize.size.sizeName} </span> <span
																		class="o-card__quantity">Màu:
																		${shoppingCart.productColor.color.colorName}</span> <span
																		class="o-card__price">Giá:
																		${shoppingCart.product.formatPrice}</span>
																</div>
															</div>


														</div>
													</c:forEach>
												</div>
											</div>
											<div class="o-summary__section u-s-m-b-30">
												<div class="o-summary__box">
													<h1 class="checkout-f__h1">THANH TOÁN & VẬN CHUYỂN</h1>
													<div class="ship-b">

														<span class="ship-b__text">Giao hàng đến:</span>

														<c:if test="${addressID != null}">
															<div class="ship-b__box u-s-m-b-10">
																<p class="ship-b__p">${addressID.detailedAddress}</p>

																<a class="ship-b__edit btn--e-transparent-platinum-b-2"
																	data-modal="modal" data-modal-id="#edit-ship-address">Chỉnh
																	sửa</a>
															</div>
														</c:if>

														<c:if test="${addressID == null}">
															<div class="ship-b__box u-s-m-b-10">
																<p class="ship-b__p">${customer.address}</p>

																<a class="ship-b__edit btn--e-transparent-platinum-b-2"
																	data-modal="modal" data-modal-id="#edit-ship-address">Chỉnh
																	sửa</a>
															</div>
														</c:if>
													</div>

												</div>
											</div>
											<div class="o-summary__section u-s-m-b-30">
												<div class="o-summary__box">
													<table class="o-summary__table">
														<tbody>
															<tr>
																<td>PHÍ VẬN CHUYỂN</td>
																<td>$0.00</td>
															</tr>
															<tr>
																<td>THUẾ</td>
																<td>$0.00</td>
															</tr>
															<tr>
																<td>TỔNG SỐ TIỀN</td>
																<td>${totals}</td>
															</tr>
															<tr>
																<td>TỔNG CỘNG</td>
																<td>${totals}</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div class="o-summary__section u-s-m-b-30">
												<div class="o-summary__box">
													<h1 class="checkout-f__h1">PHƯƠNG THỨC THANH TOÁN</h1>

													<c:forEach items="${payments}" var="payment">
														<div class="u-s-m-b-10">

															<!--====== Radio Box ======-->
															<div class="radio-box">

																<input type="radio" id="cash-on-delivery"
																	value="${payment.paymentMethodID}" name="payment">
																<div class="radio-box__state radio-box__state--primary">

																	<label class="radio-box__label" for="cash-on-delivery">${payment.paymentName}</label>
																</div>
															</div>
															<!--====== End - Radio Box ======-->


															<c:if test="${payment.paymentMethodID == 2}">
																<span class="gl-text u-s-m-t-6">Thanh toán tiền
																	mặt khi nhận hàng. </span>
															</c:if>
															
															
															<c:if test="${payment.paymentMethodID == 3}">
																<span class="gl-text u-s-m-t-6">Thanh toán thông qua Paypal.<br>
																Giá sản phẩm sẽ được chuyển đổi sang <span style="color: #ff4500">USD</span> ở trên trang của PayPal với tỷ giá <span style="color: #ff4500">USD / VND = 22770</span>
																</span>
															</c:if>
														</div>
													</c:forEach>
													<span class="checkout-f__h1"
														style="color: red; font-size: 12px; margin-bottom: 25px;">${errpayment}</span>

													<div class="u-s-m-b-15">

														<!--====== Check Box ======-->
														<div class="check-box">

															<input type="checkbox" id="term-and-condition">
															<div class="check-box__state check-box__state--primary">


															</div>
														</div>
														<!--====== End - Check Box ======-->

													</div>
													<div>

														<button class="btn btn--e-brand-b-2">ĐẶT HÀNG</button>
													</div>
												</div>
											</div>
										</div>
										<!--====== End - Order Summary ======-->
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
				<!--====== End - Section Content ======-->
			</div>
			<!--====== End - Section 3 ======-->
		</div>
		<!--====== End - App Content ======-->


		<!--====== Footer ======-->
		<jsp:include page="../share_page/footer.jsp"></jsp:include>


		<!--====== Modal Section ======-->


		<!--====== Shipping Address Add Modal ======-->
		<div class="modal fade" id="edit-ship-address">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body">
						<div class="checkout-modal2">
							<div class="u-s-m-b-30">
								<div class="dash-l-r">
									<h1 class="gl-modal-h1">Địa chỉ giao hàng</h1>
									<div class="dash__link dash__link--brand">

										<a data-modal="modal" data-modal-id="#add-ship-address"
											data-dismiss="modal">Thêm địa chỉ mới</a>
									</div>
								</div>
							</div>
							<form class="checkout-modal2__form" action="save-address"
								method="post">
								<div class="dash__table-2-wrap u-s-m-b-30 gl-scroll">

									<table class="dash__table-2">
										<thead>
											<tr>
												<th>Hoạt động</th>
												<th>Họ và tên</th>
												<th>Địa chỉ</th>
												<th>Số điện thoại</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${listAddress}" var="address">
												<tr>
													<td>
														<!--====== Radio Box ======-->
														<div class="radio-box">

															<input type="radio" id="address-1" checked="checked"
																value="${address.addressId}" name="address">
															<div class="radio-box__state radio-box__state--primary">
																<label class="radio-box__label" for="address-1"></label>
															</div>
														</div> <!--====== End - Radio Box ======-->
													</td>

													<td>${address.customerName}</td>

													<td>${address.detailedAddress}</td>
													<td>${address.phoneNumber}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>

								<div class="gl-modal-btn-group">

									<button class="btn btn--e-brand-b-2" type="submit">LƯU</button>

									<button class="btn btn--e-grey-b-2" type="button"
										data-dismiss="modal">HỦY</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--====== End - Shipping Address Add Modal ======-->


		<!--====== Shipping Address Add Modal ======-->
		<div class="modal fade" id="add-ship-address">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body">
						<div class="checkout-modal1">
							<form class="checkout-modal1__form" action="add-address"
								method="post">
								<div class="u-s-m-b-30">
									<h1 class="gl-modal-h1">Thêm địa chỉ giao hàng mới</h1>
								</div>

								<div class="gl-inline">
									<div class="u-s-m-b-30">

										<label class="gl-label" for="address-phone">SỐ ĐIỆN
											THOẠI *</label> <input class="input-text input-text--primary-style"
											name="phone" type="text" id="address-phone" required>
									</div>
									<div class="u-s-m-b-30">

										<label class="gl-label" for="address-street">ĐỊA CHỈ *</label>
										<input class="input-text input-text--primary-style"
											name="address" type="text" id="address-street"
											placeholder="Địa chỉ chi tiết" required>
									</div>
								</div>
								<div class="u-s-m-b-30">

									<label class="gl-label" for="address-fname">Họ và tên
										*</label> <input name="customerName"
										class="input-text input-text--primary-style" type="text"
										id="address-fname" placeholder="Tên" required>
								</div>
								<div class="gl-modal-btn-group">

									<button class="btn btn--e-brand-b-2" type="submit">LƯU</button>

									<button class="btn btn--e-grey-b-2" type="button"
										data-dismiss="modal">HỦY</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--====== End - Shipping Address Add Modal ======-->
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
</body>
</html>
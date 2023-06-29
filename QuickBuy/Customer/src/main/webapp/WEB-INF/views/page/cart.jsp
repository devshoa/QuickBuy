<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="images/favicon.png" rel="shortcut icon">
<title>Ludus - Giỏ Hàng</title>

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
									<li class="is-marked"><a href="cart">Giỏ hàng</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--====== End - Section 1 ======-->


			<!--====== Section 2 ======-->
			<form action="add-product-to-checkout" method="post">

				<div class="u-s-p-b-60">

					<!--====== Section Intro ======-->
					<div class="section__intro u-s-m-b-60">
						<div class="container">
							<div class="row">
								<div class="col-lg-12">
									<div class="section__text-wrap">
										<h1 class="section__heading u-c-secondary">GIỎ HÀNG</h1>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--====== End - Section Intro ======-->

					<h2 style="text-align: center">${errCartEmpty}</h2>

					<!--====== Section Content ======-->
					<div class="section__content">
						<div class="container">
							<div class="row">
								<div class="col-lg-12 col-md-12 col-sm-12 u-s-m-b-30">
									<div class="table-responsive">
										<table class="table-p">
											<tbody>
												<c:forEach items="${shoppingCarts}" var="item">

													<!--====== Row ======-->
													<tr>
														<td><input type="checkbox" checked="checked"
															value="${item.shoppingCartItemID}" name="productcartid"></td>
														<td>
															<div class="table-p__box">
																<div class="table-p__img-wrap">

																	<img class="u-img-fluid" src="${item.product.image}"
																		alt="">
																</div>
																<div class="table-p__info">

																	<span class="table-p__name"> <a
																		href="product-detail?product-id=${item.product.productID}">${item.product.productName}</a></span>
																	<span class="table-p__category"> <a
																		href="shop-side-version-2">Danh mục:
																			${item.product.category.categoryName}</a></span>
																	<ul class="table-p__variant-list">
																		<li><span>Kích thước:
																				${item.productSize.size.sizeName}</span></li>
																		<li><span>Màu sắc:
																				${item.productColor.color.colorName }</span></li>
																		<li><span>Số lượng:
																				${item.quantity }</span></li>
																	</ul>
																</div>
															</div>
														</td>
														<td><span class="table-p__price">${item.product.formatPrice}
														</span></td>
														<td>
															<div class="table-p__del-wrap">
																<form method="post"
																	action="delete-cart-item?shopping-cart-item-id=${item.shoppingCartItemID}">
																	<button class="far fa-trash-alt table-p__delete-link"
																		type="submit"
																		style="background: none; border: none; cursor: pointer;"></button>
																</form>
															</div>
														</td>
													</tr>
													<!--====== End - Row ======-->
												</c:forEach>

											</tbody>
										</table>
									</div>

								</div>
								<div class="col-lg-12">
									<div class="route-box">
										<div class="route-box__g1">

											<a class="route-box__link" href="shop-side-version-2"><i
												class="fas fa-long-arrow-alt-left"></i> <span>TIẾP
													TỤC MUA SẮM</span></a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--====== End - Section Content ======-->
				</div>
				<!--====== End - Section 2 ======-->


				<!--====== Section 3 ======-->
				<div class="u-s-p-b-60">

					<!--====== Section Content ======-->
					<c:if test="${errCartEmpty == null}">
						<div class="section__content">
							<div class="container">
								<div class="row">
									<div class="col-lg-12 col-md-12 col-sm-12 u-s-m-b-30">
										<div class="row">
											<div class="col-lg-4 col-md-6 u-s-m-b-30">
												<div class="f-cart__pad-box">
													<div class="u-s-m-b-30">
														<table class="f-cart__table">
															<tbody>
																<tr>
																	<td>PHÍ VẬN CHUYỂN</td>
																	<td>0.00 VNĐ</td>
																</tr>
																<tr>
																	<td>THUẾ</td>
																	<td>0.00 VNĐ</td>
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
													<div>
														<button style="padding: 10px 15px"
															class="btn btn--e-brand-b-2" type="submit">THANH
															TOÁN NGAY</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>
					<!--====== End - Section Content ======-->
				</div>
				<!--====== End - Section 3 ======-->

				<!--====== End - App Content ======-->
			</form>


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
		<script src="https://www.google-analytics.com/analytics.js" async
			defer></script>

		<!--====== Vendor Js ======-->
		<script src="js/vendor.js"></script>

		<!--====== jQuery Shopnav plugin ======-->
		<script src="js/jquery.shopnav.js"></script>

		<!--====== App ======-->
		<script src="js/app.js"></script>
</body>
</html>
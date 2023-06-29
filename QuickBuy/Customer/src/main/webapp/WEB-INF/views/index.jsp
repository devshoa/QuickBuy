<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="images/favicon.png" rel="shortcut icon">
<title>QuickBuy</title>

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
<body>
	<!-- <div class="preloader is-active">
        <div class="preloader__wrap">

            <img class="preloader__img" src="images/preloader.png" alt="">
        </div>
    </div> -->

	<!--====== Main App ======-->
	<div id="app">

		<!--====== Header ======-->
		<jsp:include page="share_page/header.jsp"></jsp:include>

		<!--====== App Content ======-->
		<div class="app-content" style="margin-top: 150px">



			<!--====== Section 2 ======-->
			<div class="u-s-p-b-60" style="margin-top: 20px">

				<!--====== Section Intro ======-->
				<div class="section__intro u-s-m-b-16">
					<div class="container">
						<div class="row">
							<div class="col-lg-12">
								<div class="section__text-wrap">
									<h1 class="section__heading u-c-secondary u-s-m-b-12">Sản
										phẩm thịnh hành</h1>

									<span class="section__span u-c-silver">Chọn danh mục</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--====== End - Section Intro ======-->


				<!--====== Section Content ======-->
				<div class="section__content">
					<div class="container">
						<div class="row">
							<div class="col-lg-12">

								<div class="filter-category-container">
									<c:forEach items="${categorys}" var="c">
										<div class="filter__category-wrapper">
											<button class="btn filter__btn filter__btn--style-1"
												type="button" data-filter=".${c.categoryName}">${c.categoryName}</button>
										</div>
									</c:forEach>
								</div>
								<div class="filter__grid-wrapper u-s-m-t-30">
									<div class="row">
										<c:forEach var="item" items="${products}">
											<div
												class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item ${item.category.categoryName}">
												<div class="product-o product-hover"
													style="box-shadow: 0 0 21px 0 rgba(0, 0, 0, 0.1);">
													<div class="product-o__wrap">

														<a class="aspect aspect--bg-grey aspect--square u-d-block"
															href="product-detail"> <img class="aspect__img"
															src="${item.image}" alt=""></a>
														<div class="product-o__action-wrap">
															<ul class="product-o__action-list">

																<c:if test="${sessionScope.acc == null}">
																	<li><a href="signin" data-tooltip="tooltip"
																		data-placement="top" title="Thêm vào giỏ hàng"><i
																			class="fas fa-plus-circle"></i></a></li>
																</c:if>

																<c:if test="${sessionScope.acc != null}">
																	<li><a data-tooltip="tooltip"
																		href="product-detail?product-id=${item.productID}"
																		data-placement="top" title="Thêm vào giỏ hàng"><i
																			class="fas fa-plus-circle"></i></a></li>
																</c:if>

															</ul>
														</div>
													</div>

													<span class="product-o__category"> <a
														href="product-detail?ct=${item.category.categoryID}">${item.category.categoryName}</a></span>
													<span class="product-o__name"> <a
														style="overflow: hidden; display: block; max-height: 4.4rem; -webkit-line-clamp: 2; display: box; display: -webkit-box; -webkit-box-orient: vertical; text-overflow: ellipsis; white-space: normal;"
														href="product-detail?product-id=${item.productID}">${item.productName}</a></span>
													<div class="product-o__rating gl-rating-style">
														<i class="fas fa-star"></i><i class="fas fa-star"></i><i
															class="fas fa-star"></i>
														<product-o__namei class="fas fa-star">
														</i> <i class="fas fa-star-half-alt"></i> <span
															class="product-o__review">(23)</span>
													</div>

													<span class="product-o__price">${item.formatPrice}<!-- <span
														class="product-o__discount">320.00 VNĐ</span> -->
													</span>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--====== End - Section Content ======-->
			</div>
			<!--====== End - Section 2 ======-->

			<!--====== Section 4 ======-->
			<div class="u-s-p-b-60">

				<!--====== Section Intro ======-->
				<div class="section__intro u-s-m-b-46">
					<div class="container">
						<div class="row">
							<div class="col-lg-12">
								<div class="section__text-wrap">
									<h1 class="section__heading u-c-secondary u-s-m-b-12">SẢN
										PHẨM MỚI</h1>

									<span class="section__span u-c-silver">NHỮNG SẢN PHẨM
										MỚI NHẤT</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--====== End - Section Intro ======-->


				<!--====== Section Content ======-->
				<div class="section__content">
					<div class="container">
						<div class="slider-fouc">
							<div class="owl-carousel product-slider" data-item="4">

								<c:forEach items="${latestProducts}" var="latestProduct">
									<div class="u-s-m-b-30">
										<div class="product-o product-o--hover-on">
											<div class="product-o__wrap">

												<a class="aspect aspect--bg-grey aspect--square u-d-block"
													href="product-detail"> <img class="aspect__img"
													src="${latestProduct.image}" alt=""></a>
												<div class="product-o__action-wrap">
													<ul class="product-o__action-list">

														<c:if test="${sessionScope.acc == null}">
															<li><a href="signin" data-tooltip="tooltip"
																data-placement="top" title="Thêm vào giỏ hàng"><i
																	class="fas fa-plus-circle"></i></a></li>
														</c:if>

														<c:if test="${sessionScope.acc != null}">
															<li><a data-tooltip="tooltip"
																href="product-detail?product-id=${latestProduct.productID}"
																data-placement="top" title="Thêm vào giỏ hàng"><i
																	class="fas fa-plus-circle"></i></a></li>
														</c:if>

													</ul>
												</div>
											</div>

											<span class="product-o__category"> <a
												href="shop-side-version-2">${latestProduct.category.categoryName}</a></span>
											<span class="product-o__name"> <a
												style="overflow: hidden; display: block; max-height: 4.4rem; -webkit-line-clamp: 2; display: box; display: -webkit-box; -webkit-box-orient: vertical; text-overflow: ellipsis; white-space: normal;"
												href="product-detail?product-id=${latestProduct.productID}">${latestProduct.productName}</a></span>
											<div class="product-o__rating gl-rating-style">
												<i class="far fa-star"></i><i class="far fa-star"></i><i
													class="far fa-star"></i><i class="far fa-star"></i><i
													class="far fa-star"></i> <span class="product-o__review">(0)</span>
											</div>

											<span class="product-o__price">${latestProduct.formatPrice}</span>
										</div>
									</div>
								</c:forEach>

							</div>
						</div>
					</div>
				</div>
				<!--====== End - Section Content ======-->
			</div>
			<!--====== End - Section 4 ======-->

			<!--====== Section 6 ======-->
			<div class="u-s-p-y-60" style="padding-top: 0">

				<!--====== Section Intro ======-->
				<div class="section__intro u-s-m-b-46">
					<div class="container">
						<div class="row">
							<div class="col-lg-12">
								<div class="section__text-wrap">
									<h1 class="section__heading u-c-secondary u-s-m-b-12">SẢN
										PHẨM NỔI BẬC</h1>

									<span class="section__span u-c-silver">TÌM SẢN PHẨM NỔI
										BẬC</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--====== End - Section Intro ======-->


				<!--====== Section Content ======-->
				<div class="section__content">
					<div class="container">
						<div class="row">

							<c:forEach items="${latestProducts}" var="i">

								<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30">
									<div class="product-o product-o--hover-on u-h-100">
										<div class="product-o__wrap">

											<a class="aspect aspect--bg-grey aspect--square u-d-block"
												href="product-detail?product-id=${i.productID}"> <img
												class="aspect__img" src="${i.image}" alt=""></a>
											<div class="product-o__action-wrap">
												<ul class="product-o__action-list">

													<li><a data-modal="modal" data-modal-id="#add-to-cart"
														data-tooltip="tooltip" data-placement="top"
														title="Thêm vào vỏ hàng"><i
															class="fas fa-plus-circle"></i></a></li>

												</ul>
											</div>
										</div>

										<span class="product-o__category"> <a
											href="shop-side-version-2">${i.category.categoryName}</a></span> <span
											class="product-o__name"> <a
											href="product-detail?product-id=${i.productID}"
											style="overflow: hidden; display: block; max-height: 4.4rem; -webkit-line-clamp: 2; display: box; display: -webkit-box; -webkit-box-orient: vertical; text-overflow: ellipsis; white-space: normal;">${i.productName}</a></span>
										<div class="product-o__rating gl-rating-style">
											<i class="fas fa-star"></i><i class="fas fa-star"></i><i
												class="fas fa-star"></i><i class="fas fa-star"></i><i
												class="fas fa-star-half-alt"></i> <span
												class="product-o__review">(23)</span>
										</div>

										<span class="product-o__price">${i.formatPrice}</span>
									</div>
								</div>


							</c:forEach>

						</div>
					</div>
				</div>
				<!--====== End - Section Content ======-->
			</div>
			<!--====== End - Section 6 ======-->

		</div>
		<!--====== End - App Content ======-->


		<!--====== Footer ======-->
		<jsp:include page="share_page/footer.jsp"></jsp:include>

		<!--====== Modal Section ======-->


		<!--====== End - Modal Section ======-->
	</div>
	<!--====== End - Main App ======-->


	<!--====== Google Analytics: change UA-XXXXX-Y to be your site's ID ======-->
	<!-- <script>
        window.ga = function () {
            ga.q.push(arguments)
        };
        ga.q = [];
        ga.l = +new Date;
        ga('create', 'UA-XXXXX-Y', 'auto');
        ga('send', 'pageview')
    </script>> -->
	<script src="https://www.google-analytics.com/analytics.js" async defer></script>

	<script src="js/vendor.js"></script>

	<script src="js/jquery.shopnav.js"></script>


	<script src="js/app.js"></script>


</body>
</html>
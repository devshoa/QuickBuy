<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!-- Header -->
<header class="header--style-1 header--box-shadow"
	style="background: linear-gradient(-180deg, #f53d2d, #f63); position: fixed; right: 0; left: 0; z-index: 999; top: 0;">

	<!--====== Nav 1 ======-->
	<nav class="primary-nav" style="height: 50px">
		<div class="container">

			<!--====== Primary Nav ======-->
			<div class="primary-nav">

				<!--====== Main Logo ======-->

				<a class="main-logo" href="/">
					<h2 style="color: white">.QuickBuy</h2>
				</a>
				<!--====== End - Main Logo ======-->


				<!--====== Search Form ======-->
				<form class="main-form">

					<label for="main-search"></label> <input
						class="input-text input-text--style-1" type="text"
						id="main-search" placeholder="Search">

					<button class="btn btn--icon fas fa-search main-search-button"
						type="submit"></button>
				</form>
				<!--====== End - Search Form ======-->


				<!--====== Dropdown Main plugin ======-->
				<div class="menu-init" id="navigation">

					<button class="btn btn--icon toggle-button fas fa-cogs"
						type="button"></button>

					<!--====== Menu ======-->
					<div class="ah-lg-mode">

						<span class="ah-close">✕ Đóng</span>

						<!--====== List ======-->
						<ul class="ah-list ah-list--design1 ah-list--link-color-secondary">
							<li class="has-dropdown" data-tooltip="tooltip"
								data-placement="left" title="Tài khoản"><a><i
									class="far fa-user-circle"></i></a> <!--====== Dropdown ======--> <span
								class="js-menu-toggle"></span>
								<ul style="width: 150px">

									<c:if test="${sessionScope.acc != null}">
										<li><a href="dashboard"><i
												class="fas fa-user-circle u-s-m-r-6"></i> <span>Tài
													khoản</span></a></li>
									</c:if>


									<c:if test="${sessionScope.acc == null}">
										<li><a href="signup"><i
												class="fas fa-user-plus u-s-m-r-6"></i> <span>Đăng
													ký</span></a></li>
										<li><a href="signin"><i class="fas fa-lock u-s-m-r-6"></i>
												<span>Đăng nhập</span></a></li>
									</c:if>


									<c:if test="${sessionScope.acc != null}">
										<li><a href="do-logout"><i
												class="fas fa-lock-open u-s-m-r-6"></i> <span>Đăng
													xuất</span></a></li>
									</c:if>


								</ul> <!--====== End - Dropdown ======--></li>
							<li data-tooltip="tooltip" data-placement="left" title="Liên hệ">

								<a href="tel:+840392677003"><i class="fas fa-phone-volume"></i></a>
							</li>
							<li data-tooltip="tooltip" data-placement="left" title="Mail">

								<a href="mailto:quickbuy@gmail.com"><i
									class="far fa-envelope"></i></a>
							</li>
						</ul>
						<!--====== End - List ======-->
					</div>
					<!--====== End - Menu ======-->
				</div>
				<!--====== End - Dropdown Main plugin ======-->
			</div>
			<!--====== End - Primary Nav ======-->
		</div>
	</nav>
	<!--====== End - Nav 1 ======-->


	<!--====== Nav 2 ======-->
	<nav class="secondary-nav-wrapper">
		<div class="container">

			<!--====== Secondary Nav ======-->
			<div class="secondary-nav">

				<!--====== Dropdown Main plugin ======-->
				<div class="menu-init" id="navigation1">

					<button class="btn btn--icon toggle-mega-text toggle-button"
						type="button">QuickBuy</button>

					<!--====== Menu ======-->
					<div class="ah-lg-mode">

						<span class="ah-close">✕ Đóng</span>

						<!--====== List ======-->
						<ul class="ah-list ">
							<li class="has-dropdown"><span class="mega-text"
								style="background: none">Tất cả sản phẩm<i
									class="fas fa-angle-down u-s-m-l-6"></i></span> <!--====== Mega Menu ======-->
								<span class="js-menu-toggle"></span>
								<div class="mega-menu">
									<div class="mega-menu-wrap">
										<div class="mega-menu-list">
											<ul>
												<li><a href="shop-side-version-2"><i
														class="fas fa-male u-s-m-r-6"></i> <span>Thời
															Trang Nam</span></a> <span class="js-menu-toggle"></span></li>
												<li><a href="shop-side-version-2"><i
														class="fas fa-female u-s-m-r-6"></i> <span>Thời
															Trang Nữ</span></a> <span class="js-menu-toggle"></span></li>
												<li><a href="/"><i
														class="fas fa-utensils u-s-m-r-6"></i> <span>Thức
															Ăn</span></a> <span class="js-menu-toggle"></span></li>
												<li><a href="/"><i class="fas fa-couch u-s-m-r-6"></i>
														<span>Nội Thất & Trang Trí</span></a> <span
													class="js-menu-toggle"></span></li>
												<li><a href="/"><i
														class="fas fa-football-ball u-s-m-r-6"></i> <span>Thể
															Thao & Trò Chơi</span></a> <span class="js-menu-toggle"></span></li>
												<li><a href="/"><i
														class="fas fa-heartbeat u-s-m-r-6"></i> <span>Làm
															Đẹp & Sức Khỏe</span></a> <span class="js-menu-toggle"></span></li>
											</ul>
										</div>

										<!--====== Electronics ======-->
										<div class="mega-menu-content js-active">

											<!--====== Mega Menu Row ======-->
											<div class="row">
												<div class="col-lg-3">
													<ul>
														<li class="mega-list-title"><a
															href="shop-side-version-2">CÁC LOẠI QUẦN</a></li>
														<li><a href="shop-side-version-2">Quần Jean</a></li>
														<li><a href="shop-side-version-2">Quần Kaki</a></li>
														<li><a href="shop-side-version-2">Quần Short</a></li>
														<li><a href="shop-side-version-2">Quần Tây</a></li>
														<li><a href="shop-side-version-2">Quần Jogger</a></li>

													</ul>
												</div>
												<div class="col-lg-3">
													<ul>
														<li class="mega-list-title"><a
															href="shop-side-version-2">CÁC LOẠI ÁO</a></li>
														<li><a href="shop-side-version-2">Áo Sơ Mi</a></li>
														<li><a href="shop-side-version-2">Áo Thun</a></li>
														<li><a href="shop-side-version-2">Áo Khoác</a></li>
														<li><a href="shop-side-version-2">Áo Hoodie</a></li>
														<li><a href="shop-side-version-2">Áo Vest</a></li>
													</ul>
												</div>
												<div class="col-lg-3">
													<ul>
														<li class="mega-list-title"><a
															href="shop-side-version-2">CÁC LOẠI GIÀY</a></li>
														<li><a href="shop-side-version-2"> Giày Thể Thao</a></li>
														<li><a href="shop-side-version-2">Giày Loafer</a></li>
														<li><a href="shop-side-version-2">Giày Tây</a></li>
														<li><a href="shop-side-version-2">Giày Sandals</a></li>
														<li><a href="shop-side-version-2">Giày Boots</a></li>
													</ul>
												</div>

											</div>
											<!--====== End - Mega Menu Row ======-->

										</div>
										<!--====== End - Electronics ======-->


										<!--====== Women ======-->
										<div class="mega-menu-content">

											<!--====== Mega Menu Row ======-->
											<div class="row">
												<div class="col-lg-3">
													<ul>
														<li class="mega-list-title"><a
															href="shop-side-version-2">CÁC LOẠI QUẦN</a></li>
														<li><a href="shop-side-version-2">Quần Jean</a></li>
														<li><a href="shop-side-version-2">Quần Kaki</a></li>
														<li><a href="shop-side-version-2">Quần Short</a></li>
														<li><a href="shop-side-version-2">Quần Tây</a></li>
														<li><a href="shop-side-version-2">Quần Jogger</a></li>

													</ul>
												</div>
												<div class="col-lg-3">
													<ul>
														<li class="mega-list-title"><a
															href="shop-side-version-2">CÁC LOẠI ÁO</a></li>
														<li><a href="shop-side-version-2">Áo Sơ Mi</a></li>
														<li><a href="shop-side-version-2">Áo Thun</a></li>
														<li><a href="shop-side-version-2">Áo Khoác</a></li>
														<li><a href="shop-side-version-2">Áo Hoodie</a></li>
														<li><a href="shop-side-version-2">Áo Vest</a></li>
													</ul>
												</div>
												<div class="col-lg-3">
													<ul>
														<li class="mega-list-title"><a
															href="shop-side-version-2">CÁC LOẠI GIÀY</a></li>
														<li><a href="shop-side-version-2"> Giày Thể Thao</a></li>
														<li><a href="shop-side-version-2">Giày Loafer</a></li>
														<li><a href="shop-side-version-2">Giày Tây</a></li>
														<li><a href="shop-side-version-2">Giày Sandals</a></li>
														<li><a href="shop-side-version-2">Giày Boots</a></li>
													</ul>
												</div>

											</div>
											<!--====== End - Mega Menu Row ======-->
										</div>
										<!--====== End - Women ======-->



										<!--====== No Sub Categories ======-->
										<div class="mega-menu-content">
											<h5>No Categories</h5>
										</div>
										<!--====== End - No Sub Categories ======-->


										<!--====== No Sub Categories ======-->
										<div class="mega-menu-content">
											<h5>No Categories</h5>
										</div>
										<!--====== End - No Sub Categories ======-->


										<!--====== No Sub Categories ======-->
										<div class="mega-menu-content">
											<h5>No Categories</h5>
										</div>
										<!--====== End - No Sub Categories ======-->


										<!--====== No Sub Categories ======-->
										<div class="mega-menu-content">
											<h5>No Categories</h5>
										</div>
										<!--====== End - No Sub Categories ======-->
									</div>
								</div> <!--====== End - Mega Menu ======--></li>
						</ul>
						<!--====== End - List ======-->

					</div>
					<!--====== End - Menu ======-->
				</div>
				<!--====== End - Dropdown Main plugin ======-->


				<!--====== Dropdown Main plugin ======-->
				<div class="menu-init" id="navigation2">

					<button class="btn btn--icon toggle-button fas fa-cog"
						type="button"></button>

					<!--====== Menu ======-->
					<div class="ah-lg-mode">

						<span class="ah-close">✕ Close</span>

						<!--====== List ======-->
						<ul class="ah-list ah-list--design2 ah-list--link-color-secondary">

							<li class="has-dropdown"><a>KHÁM PHÁ<i
									class="fas fa-angle-down u-s-m-l-6"></i></a> <!--====== Dropdown ======-->

								<span class="js-menu-toggle"></span>
								<ul style="width: 170px">

									<c:if test="${sessionScope.acc != null}">
										<li class="has-dropdown has-dropdown--ul-left-100"><a>Tài
												Khoản<i class="fas fa-angle-down i-state-right u-s-m-l-6"></i>
										</a> <!--====== Dropdown ======--> <span class="js-menu-toggle"></span>
											<ul style="width: 200px">
												<li><a href="signin">Đăng Nhập</a></li>
												<li><a href="signup">Đăng Ký</a></li>
												<li><a href="lost-password">Quên Mật Khẩu</a></li>
											</ul> <!--====== End - Dropdown ======--></li>
										<li class="has-dropdown has-dropdown--ul-left-100"><a
											href="dashboard">Bảng Điều Kiển<i
												class="fas fa-angle-down i-state-right u-s-m-l-6"></i></a> <!--====== Dropdown ======-->

											<span class="js-menu-toggle"></span>
											<ul style="width: 200px">
												<li class="has-dropdown has-dropdown--ul-left-100"><a
													href="dashboard">Quản Lý Tài Khoản<i
														class="fas fa-angle-down i-state-right u-s-m-l-6"></i></a> <!--====== Dropdown ======-->

													<span class="js-menu-toggle"></span>
													<ul style="width: 180px">
														<li><a href="dash-edit-profile">Chỉnh Sửa Hồ
																Sơ</a></li>
														<li><a href="dash-address-book">Chỉnh Sửa Địa
																Chỉ</a></li>
														<li><a href="dash-manage-order">Quản Lý Đơn
																Hàng</a></li>
													</ul> <!--====== End - Dropdown ======--></li>
												<li><a href="dash-my-profile">Thông Tin Của Tôi</a></li>
												<li class="has-dropdown has-dropdown--ul-left-100"><a
													href="dash-address-book">Địa Chỉ<i
														class="fas fa-angle-down i-state-right u-s-m-l-6"></i></a> <!--====== Dropdown ======-->

													<span class="js-menu-toggle"></span>
													<ul style="width: 180px">
														<li><a href="dash-address-make-default">Địa Chỉ
																Đặt Làm Mặc Định</a></li>
														<li><a href="dash-address-add">Thêm Địa Chỉ
																Mới</a></li>
														<li><a href="dash-address-edit">Chỉnh Sửa Địa
																Chỉ</a></li>
													</ul> <!--====== End - Dropdown ======--></li>
												<li><a href="dash-track-order">Theo Dõi Đơn Hàng</a></li>
												<li><a href="dash-my-order">Đơn Hàng Của Tôi</a></li>
												<li><a href="dash-payment-option">Phương Thức
														Thanh Toán</a></li>
												<li><a href="dash-cancellation">Trả Lại & Hủy
														Bỏ</a></li>
											</ul> <!--====== End - Dropdown ======--></li>
									</c:if>


									<li><a href="cart">Giỏ Hàng</a></li>
									<li><a href="checkout">Thủ Tục Thanh Toán</a></li>
									<li><a href="faq">Câu Hỏi Thường Gặp</a></li>
									<li><a href="about">Về Chúng Tôi</a></li>
									<li><a href="contact">Liên Hệ</a></li>
								</ul> <!--====== End - Dropdown ======--></li>
							<li class="has-dropdown"><a>Bài Viết</a> <!--====== Dropdown ======-->

								<span class="js-menu-toggle"></span>
							<li><a href="shop-side-version-2">Khuyến Mãi</a></li>
						</ul>
						<!--====== End - List ======-->
					</div>
					<!--====== End - Menu ======-->
				</div>
				<!--====== End - Dropdown Main plugin ======-->


				<!--====== Dropdown Main plugin ======-->
				<div class="menu-init" id="navigation3">

					<button
						class="btn btn--icon toggle-button fas fa-shopping-bag toggle-button-shop"
						type="button"></button>

					<span class="total-item-round">2</span>

					<!--====== Menu ======-->
					<div class="ah-lg-mode">

						<span class="ah-close">✕ Đóng</span>

						<!--====== List ======-->
						<ul class="ah-list ah-list--design1 ah-list--link-color-secondary">
							<li><a href="/"><i class="fas fa-home"></i></a></li>


							<c:if test="${sessionScope.acc == null}">
								<li class="has-dropdown"><a href="signin"
									class="mini-cart-shop-link"><i class="fas fa-shopping-bag"></i></a></li>
							</c:if>

							<c:if test="${sessionScope.acc != null}">
								<li class="has-dropdown"><a class="mini-cart-shop-link"><i
										class="fas fa-shopping-bag"></i> <span
										class="total-item-round">${numberOfProducts}</span></a> <!--====== Dropdown ======-->
									<span class="js-menu-toggle"></span>
									<div class="mini-cart">

										<!--====== Mini Product Container ======-->
										<div class="mini-product-container gl-scroll u-s-m-b-15">

											<c:forEach items="${shoppingCarts}" var="cartitem">
												<!--====== Card for mini cart ======-->
												<div class="card-mini-product">
													<div class="mini-product">
														<div class="mini-product__image-wrapper">

															<a class="mini-product__link" href="product-detail">
																<img class="u-img-fluid" src="${cartitem.product.image}"
																alt="">
															</a>
														</div>
														<div class="mini-product__info-wrapper">

															<span class="mini-product__category"> <a
																href="shop-side-version-2">${cartitem.product.category.categoryName}</a></span>
															<span class="mini-product__name"> <a
																href="product-detail?product-id=${cartitem.product.productID}">${cartitem.product.productName}</a></span>
															<span class="mini-product__quantity">${cartitem.quantity}
																x</span> <span class="mini-product__quantity">${cartitem.product.formatPrice}
															</span>

														</div>
													</div>
													<form method="post"
														action="delete-cart-item?shopping-cart-item-id=${cartitem.shoppingCartItemID}">
														<button
															style="background: none; border: none; cursor: pointer;"
															class="mini-product__delete-link far fa-trash-alt"></button>
													</form>
												</div>
												<!--====== End - Card for mini cart ======-->

											</c:forEach>


										</div>
										<!--====== End - Mini Product Container ======-->

										<!--====== Mini Product Statistics ======-->
										<div class="mini-product-stat">
											<div class="mini-total">

												<span class="subtotal-text">TỔNG TIỀN</span> <span
													class="subtotal-value">${totals}</span>
											</div>
											<div class="mini-action">

												<a class="mini-link btn--e-brand-b-2" href="checkout">THANH
													TOÁN NGAY</a> <a
													class="mini-link btn--e-transparent-secondary-b-2"
													href="cart">XEM GIỎ HÀNG</a>
											</div>
										</div>
										<!--====== End - Mini Product Statistics ======-->
									</div> <!--====== End - Dropdown ======--></li>
							</c:if>




						</ul>
						<!--====== End - List ======-->
					</div>
					<!--====== End - Menu ======-->
				</div>
				<!--====== End - Dropdown Main plugin ======-->
			</div>
			<!--====== End - Secondary Nav ======-->
		</div>
	</nav>
	<!--====== End - Nav 2 ======-->
</header>
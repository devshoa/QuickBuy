<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html lang="en">
<head>
<base href="/" />
<meta charset="utf-8" />
<meta name="viewport" content="initial-scale=1, maximum-scale=1, minimum-scale=1">
<link rel="icon" type="image/x-icon" href="assetss/images/favicon.ico">

<link href="assetss/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="assetss/css/style.css" rel="stylesheet" type="text/css">
<link href="assetss/css/main.css" rel="stylesheet" type="text/css">
</head>
<body class="fixed-left">
	<!-- Loader -->
	<div id="preloader">
		<div id="status">
			<div class="spinner"></div>
		</div>
	</div>
	<!-- Begin page -->
	<div id="wrapper">
		<!-- ========== Left Sidebar Start ========== -->
		<div class="left side-menu">
			<button type="button" class="button-menu-mobile button-menu-mobile-topbar open-left waves-effect">
				<i class="ion-close"></i>
			</button>
			<!-- LOGO -->
			<div class="topbar-left">
				<div class="text-center bg-logo">
					<a href="index" class="logo">
						<img src="assetss/images/logo-4.jpg">
					</a>
				</div>
			</div>
			<div class="sidebar-user">
				<h6 class="">Admin</h6>
				<ul class="list-unstyled list-inline mb-0 mt-2">
					<li class="list-inline-item">
						<a data-toggle="tooltip" data-placement="top">
							<i class="dripicons-user text-purple"></i>
						</a>
					</li>
					<li class="list-inline-item">
						<a data-toggle="tooltip" data-placement="top">
							<i class="dripicons-gear text-dark"></i>
						</a>
					</li>
					<li class="list-inline-item">
						<a href="logout" data-toggle="tooltip" data-placement="top">
							<i class="dripicons-power text-danger"></i>
						</a>
					</li>
				</ul>
			</div>
			<div class="sidebar-inner slimscrollleft">
				<div id="sidebar-menu">
					<ul>
						<li>
							<a href="" class="waves-effect" target="_blank">
								<i class="dripicons-preview"></i>
								<span> Mollee Store </span>
							</a>
						</li>
						<li>
							<a href="admin/index" class="waves-effect">
								<i class="dripicons-device-desktop"></i>
								<span>
									Bảng điều khiển
								</span>
							</a>
						</li>
						<li>
							<a href="admin/account" class="waves-effect">
								<i class="dripicons-user-group"></i>
								<span>
									Người dùng
								</span>
							</a>
						</li>
						<li>
							<a href="admin/product" class="waves-effect">
								<i class="dripicons-store"></i>
								<span>
									Sản phẩm
								</span>
							</a>
						</li>
						<li>
							<a href="admin/category" class="waves-effect">
								<i class="dripicons-duplicate"></i>
								<span>
									Danh mục
								</span>
							</a>
						</li>
						<li>
							<a href="admin/brand" class="waves-effect">
								<i class="dripicons-lightbulb"></i>
								<span>
									Thương hiệu
								</span>
							</a>
						</li>
						<li>
							<a href="admin/order" class="waves-effect">
								<i class="dripicons-cart"></i>
								<span>
									Đơn hàng
								</span>
							</a>
						</li>
						<li class="has_sub">
							<a href="javascript:void(0);" class="waves-effect">
								<i class="dripicons-graph-pie"></i>
								<span>
									Doanh thu
								</span>
								<span class="float-right">
									<i class="mdi mdi-chevron-right"></i>
								</span>
							</a>
							<ul class="list-unstyled">
								<li>
									<a href="admin/revenue">
										Theo thể loại
									</a>
								</li>
								<li>
									<a href="admin/revenue1">
										Theo ngày
									</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
			<!-- end sidebarinner -->
		</div>
		<!-- Left Sidebar End -->

		<!-- Start right Content here -->
		<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<!-- Top Bar Start -->
				<div class="topbar">
					<nav class="navbar-custom">
						<ul class="list-inline float-right mb-0">
							<!-- language-->
							<li class="list-inline-item dropdown notification-list hide-phone">
								<a class="nav-link dropdown-toggle arrow-none waves-effect text-white" data-toggle="dropdown"
									role="button" aria-haspopup="false" aria-expanded="false">
									<i class="dripicons-web noti-icon"></i>
								</a>
								<div class="dropdown-menu dropdown-menu-right language-switch" x-placement="bottom-end"
									style="position: absolute; transform: translate3d(103px, 70px, 0px); top: 0px; left: 0px; will-change: transform;">
									<a class="dropdown-item" href="admin/index?lang=en">
										<img src="assetss/images/flags/us_flag.jpg" height="16">
										<span>
											Tiếng anh
										</span>
									</a>
									<a class="dropdown-item" href="admin/index?lang=vi">
										<img src="assetss/images/flags/vn_flag.jpg" height="16">
										<span>
											Tiếng việt
										</span>
									</a>
								</div>
							</li>
							<li class="list-inline-item dropdown notification-list">
								<a class="nav-link dropdown-toggle arrow-none waves-effect" data-toggle="dropdown" href="#"
									role="button" aria-haspopup="false" aria-expanded="false">
									<i class="dripicons-mail noti-icon"></i>
									<span class="badge badge-danger noti-icon-badge">1</span>
								</a>
								<div class="dropdown-menu dropdown-menu-right dropdown-arrow dropdown-menu-lg"
									x-placement="bottom-end"
									style="position: absolute; transform: translate3d(-214px, 70px, 0px); top: 0px; left: 0px; will-change: transform;">
									<div class="dropdown-item noti-title">
										<h5>Messages</h5>
									</div>
									<!-- item-->
									<a href="javascript:void(0);" class="dropdown-item notify-item">
										<p class="notify-details">
											<b>Admin</b><small class="text-muted">Dummy text of the printing and typesetting industry.</small>
										</p>
									</a>
									<a href="javascript:void(0);" class="dropdown-item notify-item border-top"> View All </a>
								</div>
							</li>
							<li class="list-inline-item dropdown notification-list">
								<a class="nav-link dropdown-toggle arrow-none waves-effect" data-toggle="dropdown" href="#"
									role="button" aria-haspopup="false" aria-expanded="false">
									<i class="dripicons-bell noti-icon"></i>
									<span class="badge badge-success noti-icon-badge">1</span>
								</a>
								<div class="dropdown-menu dropdown-menu-right dropdown-arrow dropdown-menu-lg"
									x-placement="bottom-end"
									style="position: absolute; transform: translate3d(56px, 70px, 0px); top: 0px; left: 0px; will-change: transform;">
									<div class="dropdown-item noti-title">
										<h5>Notification</h5>
									</div>
									<!-- item-->
									<a href="javascript:void(0);" class="dropdown-item notify-item">
										<div class="notify-icon bg-primary">
											<i class="mdi mdi-cart-outline"></i>
										</div>
										<p class="notify-details">
											<b>Your order is placed</b><small class="text-muted">Dummy text of the printing and
												typesetting industry.</small>
										</p>
									</a>
									<a href="javascript:void(0);" class="dropdown-item notify-item border-top"> View All </a>
								</div>
							</li>
							<li class="list-inline-item dropdown notification-list">
								<a class="nav-link dropdown-toggle arrow-none waves-effect nav-user" data-toggle="dropdown"
									role="button" aria-haspopup="false" aria-expanded="false">
									<img src="assetss/images/avatar.jpg" alt="user" class="rounded-circle">
								</a>
								<div class="dropdown-menu dropdown-menu-right profile-dropdown ">
									<!-- item-->
									<a class="dropdown-item">
										<i class="mdi mdi-account-circle m-r-5 text-muted"></i>
										Hồ sơ
									</a>
									<a class="dropdown-item">
										<i class="mdi mdi-settings m-r-5 text-muted"></i>
										Cài đặt
									</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="logout">
										<i class="mdi mdi-logout m-r-5 text-muted"></i>
										Đăng xuất
									</a>
								</div>
							</li>
						</ul>
						<ul class="list-inline menu-left mb-0">
							<li class="float-left">
								<button class="button-menu-mobile open-left waves-light waves-effect">
									<i class="mdi mdi-menu"></i>
								</button>
							</li>
						</ul>
						<div class="clearfix"></div>
					</nav>
				</div>
				<!-- Top Bar End -->
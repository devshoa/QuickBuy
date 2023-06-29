<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<jsp:include page="header.jsp" />
<!-- Top Bar End -->
<title>Bảng điều khiển | QuickBuy</title>
<div class="page-content-wrapper">
	<div class="container-fluid">
		<div class="row">
		<label>Tài khoản</label>
			<div class="col-sm-12">
				<div class="page-title-box">
					<div class="btn-group float-right">
						<ol class="breadcrumb hide-phone p-0 m-0">
							<li class="breadcrumb-item"><a href="#">Admin</a></li>
							<li class="breadcrumb-item active">Bảng điều khiển</li>
						</ol>
					</div>
					<h4 class="page-title">Bảng điều khiển</h4>
				</div>
			</div>
		</div>
		<!-- end page title end breadcrumb -->
		<div class="row">
			<div class="col-lg-12">
				<div class="row">
					<div class="col-lg-3">
						<div class="card">
							<div class="card-body">
								<div class="icon-contain">
									<div class="row">
										<div class="col-2 align-self-center">
											<i class="fas fa-boxes text-gradient-danger"></i>
										</div>
										<div class="col-10 text-right">
											<h5 class="mt-0 mb-1">${product}</h5>
											<p class="mb-0 font-12 text-muted">Sản phẩm</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="card">
							<div class="card-body justify-content-center">
								<div class="icon-contain">
									<div class="row">
										<div class="col-2 align-self-center">
											<i class="fas fa-archive text-gradient-danger"></i>
										</div>
										<div class="col-10 text-right">
											<h5 class="mt-0 mb-1">${category}</h5>
											<p class="mb-0 font-12 text-muted">Danh mục</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="card">
							<div class="card-body">
								<div class="icon-contain">
									<div class="row">
										<div class="col-2 align-self-center">
											<i class="fas fa-user text-gradient-danger"></i>
										</div>
										<div class="col-10 text-right">
											<h5 class="mt-0 mb-1">${account}</h5>
											<p class="mb-0 font-12 text-muted">Người dùng</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="card ">
							<div class="card-body">
								<div class="icon-contain">
									<div class="row">
										<div class="col-2 align-self-center">
											<i class="far fa-gem text-gradient-danger"></i>
										</div>
										<div class="col-10 text-right">
											<h5 class="mt-0 mb-1">67.100.111 VNĐ</h5>
											<p class="mb-0 font-12 text-muted">Tổng doanh thu</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xl-4">
				<div class="card">
					<div class="card-body">
						<h5 class="header-title pb-3 mt-0">Khách hàng mới</h5>
						<div class="table-responsive boxscroll"
							style="overflow: hidden; outline: none;">
							<table class="table mb-0">
								<tbody>

									<tr>
										<td class="border-top-0">
											<div class="media">
												<img src="img/accounts/anhHieu1.jpg"
													class="thumb-md rounded-circle">
												<div class="media-body ml-2">
													<p class="mb-0">Nguyễn Văn A</p>
													<span class="font-12 text-muted">admin</span>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td class="border-top-0">
											<div class="media">
												<img src="img/accounts/hackKer.jpg"
													class="thumb-md rounded-circle">
												<div class="media-body ml-2">
													<p class="mb-0">Văn Tấn</p>
													<span class="font-12 text-muted">tantv</span>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td class="border-top-0">
											<div class="media">
												<img src="img/accounts/noavt.png"
													class="thumb-md rounded-circle">
												<div class="media-body ml-2">
													<p class="mb-0">Thái Hòa</p>
													<span class="font-12 text-muted">hoavt</span>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td class="border-top-0">
											<div class="media">
												<img src="img/accounts/noavt.png"
													class="thumb-md rounded-circle">
												<div class="media-body ml-2">
													<p class="mb-0">Ngọc Nhi</p>
													<span class="font-12 text-muted">ngocnhi</span>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td class="border-top-0">
											<div class="media">
												<img src="img/accounts/anhHieu.jpg"
													class="thumb-md rounded-circle">
												<div class="media-body ml-2">
													<p class="mb-0">Lionel Messi</p>
													<span class="font-12 text-muted">messi</span>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td class="border-top-0">
											<div class="media">
												<img src="img/accounts/noavt.png"
													class="thumb-md rounded-circle">
												<div class="media-body ml-2">
													<p class="mb-0">Cristiano Ronaldo</p>
													<span class="font-12 text-muted">ronaldo</span>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td class="border-top-0">
											<div class="media">
												<img src="img/accounts/noavt.png"
													class="thumb-md rounded-circle">
												<div class="media-body ml-2">
													<p class="mb-0">Mỹ Cát</p>
													<span class="font-12 text-muted">gsipper9</span>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td class="border-top-0">
											<div class="media">
												<img src="img/accounts/noavt.png"
													class="thumb-md rounded-circle">
												<div class="media-body ml-2">
													<p class="mb-0">Ân Hình</p>
													<span class="font-12 text-muted">hfoucar5</span>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td class="border-top-0">
											<div class="media">
												<img src="img/accounts/noavt.png"
													class="thumb-md rounded-circle">
												<div class="media-body ml-2">
													<p class="mb-0">Kiên Ninh</p>
													<span class="font-12 text-muted">hgoomesh</span>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td class="border-top-0">
											<div class="media">
												<img src="img/accounts/noavt.png"
													class="thumb-md rounded-circle">
												<div class="media-body ml-2">
													<p class="mb-0">Trúc Vi</p>
													<span class="font-12 text-muted">hnorgan8</span>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td class="border-top-0">
											<div class="media">
												<img src="img/accounts/noavt.png"
													class="thumb-md rounded-circle">
												<div class="media-body ml-2">
													<p class="mb-0">Quang Khương</p>
													<span class="font-12 text-muted">kpenritg</span>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td class="border-top-0">
											<div class="media">
												<img src="img/accounts/noavt.png"
													class="thumb-md rounded-circle">
												<div class="media-body ml-2">
													<p class="mb-0">Thái Cung</p>
													<span class="font-12 text-muted">mlovejoy3</span>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td class="border-top-0">
											<div class="media">
												<img src="img/accounts/noavt.png"
													class="thumb-md rounded-circle">
												<div class="media-body ml-2">
													<p class="mb-0">Thọ Thiều</p>
													<span class="font-12 text-muted">ngerdez4</span>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td class="border-top-0">
											<div class="media">
												<img src="img/accounts/noavt.png"
													class="thumb-md rounded-circle">
												<div class="media-body ml-2">
													<p class="mb-0">Quyền Chung</p>
													<span class="font-12 text-muted">pcaelnic</span>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td class="border-top-0">
											<div class="media">
												<img src="img/accounts/noavt.png"
													class="thumb-md rounded-circle">
												<div class="media-body ml-2">
													<p class="mb-0">Nhã Đan</p>
													<span class="font-12 text-muted">pcowell1</span>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td class="border-top-0">
											<div class="media">
												<img src="img/accounts/noavt.png"
													class="thumb-md rounded-circle">
												<div class="media-body ml-2">
													<p class="mb-0">Vỹ Quản</p>
													<span class="font-12 text-muted">pdolane</span>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td class="border-top-0">
											<div class="media">
												<img src="img/accounts/noavt.png"
													class="thumb-md rounded-circle">
												<div class="media-body ml-2">
													<p class="mb-0">Hải Tiêu</p>
													<span class="font-12 text-muted">rfealeyi</span>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td class="border-top-0">
											<div class="media">
												<img src="img/accounts/cherry.png"
													class="thumb-md rounded-circle">
												<div class="media-body ml-2">
													<p class="mb-0">Nguyễn Văn A</p>
													<span class="font-12 text-muted">tantv</span>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td class="border-top-0">
											<div class="media">
												<img src="img/accounts/noavt.png"
													class="thumb-md rounded-circle">
												<div class="media-body ml-2">
													<p class="mb-0">Thành Thịnh</p>
													<span class="font-12 text-muted">tgilletb</span>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td class="border-top-0">
											<div class="media">
												<img src="img/accounts/noavt.png"
													class="thumb-md rounded-circle">
												<div class="media-body ml-2">
													<p class="mb-0">Phúc Thôi</p>
													<span class="font-12 text-muted">tjerach7</span>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td class="border-top-0">
											<div class="media">
												<img src="img/accounts/noavt.png"
													class="thumb-md rounded-circle">
												<div class="media-body ml-2">
													<p class="mb-0">Trưởng Bùi</p>
													<span class="font-12 text-muted">vyahin6</span>
												</div>
											</div>
										</td>
									</tr>

								</tbody>
							</table>
						</div>

					</div>
				</div>
			</div>
			<div class="col-xl-4">
				<div class="card">
					<div class="card-body">
						<h5 class="header-title pb-3 mt-0">Khách hàng thân thiết</h5>
						<div class="table-responsive boxscroll"
							style="overflow: hidden; outline: none;">
							<table class="table mb-0">
								<tbody>

									<tr>
										<td class="border-top-0">
											<div class="media">
												<img src="img/accounts/cherry.png"
													class="thumb-md rounded-circle">
												<div class="media-body ml-2">
													<p class="mb-0">Nguyễn Văn A</p>
													<span class="font-12 text-muted">admin</span>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td class="border-top-0">
											<div class="media">
												<img src="img/accounts/noavt.png"
													class="thumb-md rounded-circle">
												<div class="media-body ml-2">
													<p class="mb-0">Sơn Tùng MTP</p>
													<span class="font-12 text-muted">sontung</span>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<td class="border-top-0">
											<div class="media">
												<img src="img/accounts/noavt.png"
													class="thumb-md rounded-circle">
												<div class="media-body ml-2">
													<p class="mb-0">Jack</p>
													<span class="font-12 text-muted">phuongtuan</span>
												</div>
											</div>
										</td>
									</tr>
									

									<tr>
										<td class="border-top-0">
											<div class="media">
												<img src="img/accounts/noavt.png"
													class="thumb-md rounded-circle">
												<div class="media-body ml-2">
													<p class="mb-0">Momo</p>
													<span class="font-12 text-muted">momo</span>
												</div>
											</div>
										</td>
									</tr>
									
									<tr>
										<td class="border-top-0">
											<div class="media">
												<img src="img/accounts/noavt.png"
													class="thumb-md rounded-circle">
												<div class="media-body ml-2">
													<p class="mb-0">Thái Vũ</p>
													<span class="font-12 text-muted">momo</span>
												</div>
											</div>
										</td>
									</tr>
									
									<tr>
										<td class="border-top-0">
											<div class="media">
												<img src="img/accounts/noavt.png"
													class="thumb-md rounded-circle">
												<div class="media-body ml-2">
													<p class="mb-0">Blackbi</p>
													<span class="font-12 text-muted">momo</span>
												</div>
											</div>
										</td>
									</tr>

								
									

									

								</tbody>
							</table>
						</div>

					</div>
				</div>
			</div>
			<div class="col-xl-4 col-lg-6">
				<div class="card timeline-card">
					<div class="card-body p-0">
						<div class="bg-gradient2 text-white text-center py-3 mb-4">
							<p class="mb-0 font-18">
								<i class="mdi mdi-clock-outline font-20"></i> This Week's
								Activity
							</p>
						</div>
					</div>
					<div class="card-body boxscroll">
						<div class="timeline">
							<div class="entry">
								<div class="title">
									<h6>10/ Oct</h6>
								</div>
								<div class="body">
									<p>
										Lorem Ipsum is simply dummy text of the printing and
										typesetting industry. Lorem Ipsum is not simply random text...
										<a href="#" class="text-primary"> Read More</a>
									</p>
								</div>
							</div>
							<div class="entry">
								<div class="title">
									<h6>9/ Oct</h6>
								</div>
								<div class="body">
									<p>
										Lorem Ipsum is simply dummy text of the printing and
										typesetting industry... <a href="#" class="text-primary">
											Read More</a>
									</p>
								</div>
							</div>
							<div class="entry">
								<div class="title">
									<h6>8/ Oct</h6>
								</div>
								<div class="body">
									<p>
										Lorem Ipsum is simply dummy text of the printing and
										typesetting industry... <a href="#" class="text-primary">
											Read More</a>
									</p>
								</div>
							</div>
							<div class="entry">
								<div class="title">
									<h6>7/ Oct</h6>
								</div>
								<div class="body">
									<p>
										Lorem Ipsum is simply dummy text of the printing and
										typesetting industry... <a href="#" class="text-primary">
											Read More</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- container -->
</div>
<!-- Page content Wrapper -->
<jsp:include page="footer.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<jsp:include page="header.jsp" />
				<!-- Top Bar End -->
<title>Quản lý đơn hàng | Molle Co., Ltd</title>
<div class="page-content-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12">
				<div class="page-title-box">
					<div class="btn-group float-right">
						<ol class="breadcrumb hide-phone p-0 m-0">
							<li class="breadcrumb-item">
								<a href="admin/índex">
									Bảng điều khiển
								</a>
							</li>
							<li class="breadcrumb-item active">
								Quản lý đơn hàng
							</li>
						</ol>
					</div>
					<h4 class="page-title">
						Quản lý đơn hàng
					</h4>
				</div>
			</div>
		</div>
		<!-- end page title end breadcrumb -->
		<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
			<li class="nav-item">
				<a class="nav-link active" id="edited-tab" data-toggle="pill" href="#edited" role="tab"
					aria-controls="edited" aria-selected="true">
					Chi tiết đơn hàng
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="admin/order">
					Quay lại đơn hàng
				</a>
			</li>
		</ul>
		<div class="tab-content" id="pills-tabContent">
			<div class="tab-pane fade show active" id="edited" role="tabpanel" aria-labelledby="edited-tab">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap"
									style="border-collapse: collapse; border-spacing: 0; width: 100%;">
									<thead>
										<tr>
											<th>
												Tên sản phẩm
											</th>
											<th>
												Giá
											</th>
											<th>
												Số lượng
											</th>
											<th>
												Tạm tính
											</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${lists}">
											<tr>
												<td>
													<b>${item.product.productName}</b>
												</td>
												<td>
													<fmt:formatNumber pattern="#,###,###.## $" type="currency" value="${item.unitPrice}"
														currencySymbol="$" />
												</td>
												<td>
													<b>${item.quantity}</b>
												</td>
												<td>
													<fmt:formatNumber pattern="#,###,###.## $" type="currency" value="${item.unitPrice * item.quantity}"
														currencySymbol="$" />
												</td>
											</tr>
										</c:forEach>
											
										
									</tbody>
								</table>
							</div>
						</div>
						<div class="card card-primary">
							<div class="card-body">
								<h4 class="card-title text-white font-20 mt-0 mb-0">
									Tổng hoá đơn
									:
									126,46 $
								</h4>
							</div>
						</div>
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
		</div>
	</div>
	<!-- container -->
</div>
<!-- Page content Wrapper -->
<jsp:include page="footer.jsp" />


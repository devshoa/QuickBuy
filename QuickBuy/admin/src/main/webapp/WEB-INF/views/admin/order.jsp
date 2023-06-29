<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<jsp:include page="header.jsp" />
<!-- Top Bar End -->
<title>Danh sách đơn hàng | QuickBuy</title>
<div class="page-content-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12">
				<div class="page-title-box">
					<div class="btn-group float-right">
						<ol class="breadcrumb hide-phone p-0 m-0">
							<li class="breadcrumb-item"><a href="admin/índex"> Bảng
									điều khiển </a></li>
							<li class="breadcrumb-item active">Danh sách đơn hàng</li>
						</ol>
					</div>
					<h4 class="page-title">Danh sách đơn hàng</h4>
				</div>
			</div>
		</div>
		<!-- end page title end breadcrumb -->
		
		
		<!-- end page title end breadcrumb -->
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-body">
						<table id="datatable-buttons"
							class="table table-striped table-bordered dt-responsive nowrap"
							style="border-collapse: collapse; border-spacing: 0; width: 100%;">
							<thead>
								<tr>
									<th>STT</th>
									<th>Ngày mua</th>

									<th>Tổng số tiền</th>
									<th>Người mua</th>
							
									<th>Phương thức thanh toán</th>
									<th>Chi tiết</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${items}">
									<tr>
										<td>${item.orderID}</td>
										<td>${item.orderDate}</td>
										<td>${item.totalMoney}</td>
										<td>${item.customer.customerName}</td>
										
										<td>${item.paymentMethod.paymentName}</td>
										<td>
											<div class="btn-group btn-group-sm">
												<a href="admin/orderdetail/${item.orderID}" class="btn btn-sm btn-success text-white">
													<span class="ti-eye"></span>
												</a>
											</div>
										</td>
										
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- end col -->
		</div>
		<!-- end row -->
	</div>
	<!-- container -->
</div>
<!-- Page content Wrapper -->
<jsp:include page="footer.jsp" />
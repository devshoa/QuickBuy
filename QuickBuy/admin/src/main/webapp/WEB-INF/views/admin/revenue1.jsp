<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<jsp:include page="header.jsp" />
				<!-- Top Bar End -->
<title>Doanh thu theo danh mục | QuickBuy</title>
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
								Doanh thu
							</li>
						</ol>
					</div>
					<h4 class="page-title">
						Tổng doanh thu
					</h4>
				</div>
			</div>
		</div>
		<!-- end page title end breadcrumb -->
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-body">
						<h4 class="mt-0 header-title">
							Theo Ngày
						</h4>
						<table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap"
							style="border-collapse: collapse; border-spacing: 0; width: 100%;">
							<thead>
								<tr>
									<th>Ngày</th>
									<th>Số lượng</th>
									<th>Tổng tiền</th>
								</tr>
							</thead>
							<tbody>
								<tr>
										<td>
											19/02/2023
										</td>
										<td>6</td>
										<td>
											306,74 $
										</td>
									</tr>
								
									<tr>
										<td>
											25/02/2023
										</td>
										<td>6</td>
										<td>
											305,53 $
										</td>
									</tr>
								
									<tr>
										<td>
											30/04/2023
										</td>
										<td>5</td>
										<td>
											224,83 $
										</td>
									</tr>
								
									<tr>
										<td>
											04/04/2023
										</td>
										<td>4</td>
										<td>
											216,15 $
										</td>
									</tr>
								
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

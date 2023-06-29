<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<jsp:include page="header.jsp" />
<!-- Top Bar End -->
<title>Quản lý thương hiệu | QuickBuy</title>
<div class="page-content-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12">
				<div class="page-title-box">
					<div class="btn-group float-right">
						<ol class="breadcrumb hide-phone p-0 m-0">
							<li class="breadcrumb-item"><a href="admin/índex"> Bảng
									điều khiển </a></li>
							<li class="breadcrumb-item active">Quản lý thương hiệu</li>
						</ol>
					</div>
					<h4 class="page-title">Quản lý thương hiệu</h4>
				</div>
			</div>
		</div>
		<!-- end page title end breadcrumb -->
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-body">
						<form:form action="admin/brand" modelAttribute="item">
							<div class="row">
								<c:if test="${not empty message}">
									<div class="col-xl-12 mx-3 alert bg-gradient1 text-white"
										style="flex: auto;">${message}</div>
								</c:if>
								<div class="col-xl-6">
									<div class="form-group row">
										<label class="col-sm-2 col-form-label"> STT </label>
										<div class="col-sm-10">
											<form:input type="number" path="brandID"
												cssClass="form-control" placeholder="123" disabled="true" />
										</div>
									</div>
									<div class="form-group row">
										<label for="example-password-input"
											class="col-sm-2 col-form-label"> Tên thương hiệu </label>
										<div class="col-sm-10">
											<form:input type="text" path="brandName"
												cssClass="form-control" placeholder="Gucci" />
											<span> <form:errors path="brandName"
													cssClass="error" />
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xl-12">
									<div class="input-group-append mt-3">
										<button class="btn btn-primary ml-3"
											formaction="admin/brand/create">Thêm mới</button>
										<button class="btn btn-primary ml-3"
											formaction="admin/brand/update">Cập nhật</button>
										<button class="btn btn-primary ml-3" type="button"
											data-toggle="modal" data-target="#delete">Xoá bỏ</button>
										<button class="btn btn-primary ml-3"
											formaction="admin/brand">Đặt lại</button>
									</div>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
			<!-- end col -->
		</div>
		<!-- end row -->
		<div class="row">
			<div class="col-12 px-0">
				<div class="card">
					<div class="card-body">
						<table id="datatable-buttons"
							class="table table-striped table-bordered dt-responsive nowrap"
							style="border-collapse: collapse; border-spacing: 0; width: 100%;">
							<thead>
								<tr>
									<th>STT</th>
									<th>Tên thương hiệu</th>
									<th>Chỉnh sửa</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${items}">
									<tr>
										<td>${item.brandID}</td>
										<td>${item.brandName}</td>
										<td>
											<a href="admin/brand/edit/${item.brandID}" class="btn btn-sm btn-success text-white">
												<span class="ti-pencil"></span>
											</a>
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
		<!-- DELETE brand -->
		<div class="modal fade" id="delete" tabindex="-1" role="dialog"
			aria-labelledby="deleteLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="deleteLabel">Bạn có chắc rằng?</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">Bạn muốn xóa thương hiệu này và không
						thể hoàn tác! Bạn có muốn tiếp tục không?</div>
					<div class="modal-footer">
						<a href="admin/brand/delete/${item.brandID}" class="btn btn-primary"> Có,
							xoá ngay </a> <a class="btn btn-secondary text-white"
							data-dismiss="modal"> Không, huỷ bỏ </a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- container -->
</div>
<!-- Page content Wrapper -->
<jsp:include page="footer.jsp" />
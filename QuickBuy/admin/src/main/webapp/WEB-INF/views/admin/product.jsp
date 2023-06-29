<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<jsp:include page="header.jsp" />
<title>Quản lý sản phẩm | QuickBuy</title>
<div class="page-content-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12">
				<div class="page-title-box">
					<div class="btn-group float-right">
						<ol class="breadcrumb hide-phone p-0 m-0">
							<li class="breadcrumb-item"><a href="admin/índex"> Bảng
									điều khiển </a></li>
							<li class="breadcrumb-item active">Quản lý sản phẩm</li>
						</ol>
					</div>
					<h4 class="page-title">Quản lý sản phẩm</h4>
				</div>
			</div>
		</div>
		<!-- end page title end breadcrumb -->
		<div class="row">
			<div class="card col-12">
				<div class="card-body">
					<form:form action="admin/product" modelAttribute="item"
						enctype="multipart/form-data" cssClass="row">
						<c:if test="${not empty message}">
							<div class="col-xl-12 mx-3 alert bg-gradient1 text-white"
								style="flex: auto;">${message}</div>
						</c:if>
						<form:errors path="*" element="ul" />

						<div class="col-xl-6">
							<div class="form-group row d-none">
								<label class="col-sm-2 col-form-label"> STT </label>
								<div class="col-sm-10">
									<form:input type="text" path="productID"
										cssClass="form-control" disabled="true" />
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label"> Tên sản phẩm </label>
								<div class="col-sm-10">
									<form:input type="text" path="productName"
										cssClass="form-control" placeholder="t-shirt" />
									<span> <form:errors path="productName" cssClass="error" />
									</span>
								</div>
							</div>


							<div class="form-group row">
								<label class="col-sm-2 col-form-label"> Danh mục </label>
								<div class="col-sm-10">
									<form:select class="form-control" path="category"
										items="${category}" />
									<span> <form:errors path="category" cssClass="error" />
									</span>
								</div>
							</div>

							<div class="form-group row">
								<label class="col-sm-2 col-form-label"> Thương Hiệu </label>
								<div class="col-sm-10">
									<form:select class="form-control" path="brand" items="${brand}" />
									<span> <form:errors path="brand" cssClass="error" />
									</span>
								</div>
							</div>

							<div class="form-group row">
								<label class="col-sm-2 col-form-label"> Giá </label>
								<div class="col-sm-10">
									<form:input type="number" path="price" cssClass="form-control"
										placeholder="123" />
									<span> <form:errors path="price" cssClass="error" />
									</span>
								</div>
							</div>



						</div>
						<div class="col-xl-6">


							<div class="form-group row">
								<label class="col-sm-2 col-form-label"> Số lượng </label>
								<div class="col-sm-10">
									<form:input type="number" path="remaining"
										cssClass="form-control" placeholder="123" />
									<span> <form:errors path="remaining" cssClass="error" />
									</span>
								</div>
							</div>

							<div class="form-group row">
								<label class="col-sm-2 col-form-label"> Xuất xứ </label>
								<div class="col-sm-10">
									<form:input type="text" path="origin" cssClass="form-control"
										placeholder="Việt Nam" />
									<span> <form:errors path="origin" cssClass="error" />
									</span>
								</div>
							</div>

							<div class="form-group row">
								<label class="col-sm-2 col-form-label"> Gửi từ </label>
								<div class="col-sm-10">
									<form:input type="text" path="sentFrom" cssClass="form-control"
										placeholder="Cần Thơ" />
									<span> <form:errors path="sentFrom" cssClass="error" />
									</span>
								</div>
							</div>

							<div class="form-group row">
								<label class="col-sm-2 col-form-label"> Ảnh </label>
								<div class="col-sm-10">
									<form:input type="file" path="image" class="custom-file-input" />
									<label class="custom-file-label mx-3">Choose file</label> <span>
										<form:errors path="image" cssClass="error" />
									</span>
								</div>
							</div>
						</div>
						<div class="col-xl-12">

							<div class="form-group row">
								<label class="col-sm-1 col-form-label"> Mô tả </label>
								<div class="col-sm-11" >
									<form:textarea  type="text" path="description"
										cssClass="form-control" placeholder=""  style="height: 110px"/>
									<span> <form:errors path="description" cssClass="error" />
									</span>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xl-12">
								<div class="input-group-append mt-3">
									<button class="btn btn-primary ml-3"
										formaction="admin/product/create">Thêm mới</button>
									<button class="btn btn-primary ml-3"
										formaction="admin/product/update">Cập nhật</button>
									<button class="btn btn-primary ml-3" type="button"
										data-toggle="modal" data-target="#delete">Xoá bỏ</button>
									<button class="btn btn-primary ml-3" formaction="admin/product">
										Đặt lại</button>
								</div>
							</div>
						</div>
					</form:form>
				</div>
			</div>
			<!-- end col -->
		</div>
		<!-- end row -->
		<div class="row">
			<div class="col-12 px-0" style="overflow-y: hidden">
				<div class="card">
					<div class="card-body">
						<h4 class="mt-0 header-title">Danh sách sản phẩm</h4>
						<table id="datatable-buttons"
							class="table table-striped table-bordered dt-responsive nowrap"
							style="border-collapse: collapse; border-spacing: 0; width: 100%;">
							<thead>
								<tr>
									<th>STT</th>
									<th>Tên sản phẩm</th>
									<th>Danh mục</th>
									<th>Hãng</th>
									<th>Giá</th>
								
									<th>Số lượng</th>
									<th>Xuất xứ</th>
									<th>Gửi từ</th>
									<th>Ảnh</th>
									<th>Chỉnh sửa</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${items}">
									<tr>
										<td>${item.productID}</td>
										<td>${item.productName}</td>
										<td>${item.category.categoryName}</td>
										<td>${item.brand.brandName}</td>
										<td>${item.price}</td>
									
										<td>${item.remaining}</td>
										<td>${item.origin}</td>
										<td>${item.sentFrom}</td>
										<td class="text-center">
											<c:if test="${item.image == null}">
												<img class="w-50" src="img/accounts/noavt.png">
											</c:if>
											<c:if test="${item.image != null}">
												<img class="w-50" src="img/accounts/${item.image}">
											</c:if>
										</td>
										<td>
											<div class="btn-group btn-group-sm">
												<a href="admin/product/edit/${item.productID}" class="btn btn-sm btn-success text-white">
													<span class="ti-pencil"></span>
												</a>
											</div>
										</td>
								</c:forEach>

								</tr>


							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- end col -->
		</div>
		<!-- end row -->
		<!-- DELETE PRODUCT -->
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
					<div class="modal-body">Bạn muốn xóa sản phẩm này và không
						thể hoàn tác! Bạn có muốn tiếp tục không?</div>
					<div class="modal-footer">
						<a href="admin/product/delete/" class="btn btn-primary"> Có,
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
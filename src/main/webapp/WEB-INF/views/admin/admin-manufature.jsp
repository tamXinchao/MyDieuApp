<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form Add Product</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
.form-group label {
	font-weight: bold;
}

.form-control {
	padding: 10px;
	font-size: 16px;
	line-height: 1.5;
}

.card {
	margin-top: 20px;
}

.btn {
	margin-top: 10px;
}

.form-primary .form-bar {
	display: none;
}

.form-primary {
	margin-bottom: 1.5rem;
}

.wide-textarea {
	width: 100%;
	height: 300px; /* Chiều cao điều chỉnh theo ý muốn */
}
</style>
</head>
<body>
	<div class="main-content">
		<div class="section__content section__content--p30">
			<!-- Main-body start -->
			<div class="container-fluid">
				<div class="page-wrapper">
					<!-- Page-body start -->
					<div class="page-body" id="main_content">
						<div class="card">
							<div class="card-header">
								<h2>Edit Manufacture</h2>

							</div>
							<div class="card-body">
								<c:if test="${not empty Message}">
									<div class="alert alert-warning">${Message}</div>
								</c:if>
								<c:if test="${not empty alert}">
									<div class="alert alert-danger">${alert}</div>
								</c:if>
								<form:form action="/admin/edit-manufature" class="form-material"
									method="post" enctype="multipart/form-data"
									modelAttribute="manufacture">
									<form:hidden path="manuId" />
									<div class="form-group row">
										<label for="manuName" class="col-sm-2 col-form-label">Tên
											Thương Hiệu</label>
										<div class="col-sm-10">
											<form:input path="manuName" class="form-control" />
											<br>
											<form:errors path="manuName" element="div"
												class="text-danger"></form:errors>
											<br>
										</div>
									</div>
									<div class="form-group row" style="height: 200px">
										<label for="info" class="col-sm-2 col-form-label">Thông
											tin</label>
										<div class="col-sm-10">
											<form:textarea path="info" rows="10"
												class="border-bottom wide-textarea" id="info" />
											<br>
											<form:errors path="info" element="div" class="text-danger"></form:errors>
											<br>
										</div>
									</div>

									<div class="form-group row">
										<div class="col-sm-4">
											<form:button class="btn btn-primary w-100 font-weight-bold"
												formaction="/admin/manufacture/create">Create</form:button>
										</div>
										<div class="col-sm-4">
											<form:button class="btn btn-warning w-100 font-weight-bold"
												formaction="/admin/manufacture/update">Update</form:button>
										</div>
										<div class="col-sm-4">
											<form:button class="btn btn-danger w-100 font-weight-bold"
												formaction="/admin/edit-manufature">Reset</form:button>
										</div>
									</div>
								</form:form>
							</div>
						</div>
					</div>
					<div id="styleSelector"></div>
				</div>
			</div>
		</div>
		<%-- 		<c:if test="${not empty successMessage}">
			<div class="alert alert-success alert-dismissible fade show"
				role="alert">
				${successMessage}
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
		</c:if> --%>
	</div>
	<div class="main-content" style="margin-top: -330px">
		<div class="section__content section__content--p30">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<!-- DATA TABLE -->
						<h3 class="title-5 m-b-35">data table</h3>
						<div class="table-data__tool">
							<div class="table-data__tool-left">
								<div class="rs-select2--light rs-select2--md">
									<select class="js-select2" name="property">
										<option selected="selected">All Properties</option>
										<option value="">Option 1</option>
										<option value="">Option 2</option>
									</select>
									<div class="dropDownSelect2"></div>
								</div>
								<div class="rs-select2--light rs-select2--sm">
									<select class="js-select2" name="time">
										<option selected="selected">Today</option>
										<option value="">3 Days</option>
										<option value="">1 Week</option>
									</select>
									<div class="dropDownSelect2"></div>
								</div>
								<button class="au-btn-filter">
									<i class="zmdi zmdi-filter-list"></i>filters
								</button>
							</div>
							<div class="table-data__tool-right">
								<div class="rs-select2--dark rs-select2--sm rs-select2--dark2">
									<button type="button"
										onclick="window.location.href='/manufacture/exportToExcel'"
										class="btn btn-dark">Export Excel</button>
									<div class="dropDownSelect2"></div>
								</div>
							</div>
						</div>
						<div class="table-responsive">
							<table class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>STT</th>
										<th>ID</th>
										<th>Tên Thương Hiệu</th>
										<th>Thông tin</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="manu" items="${manufactures}" varStatus="index">
										<tr class="tr-shadow">
											<td>${index.index+1}</td>
											<td>${manu.manuId}</td>
											<td>${manu.manuName}</td>
											<td>${manu.info}</td>
											<td>
												<div class="table-data-feature">
													<button class="item" data-toggle="tooltip"
														data-placement="top" title="Edit">
														<a href="/admin/manufacture/edit/${manu.manuId}"> <i
															class="zmdi zmdi-edit"></i>
														</a>
													</button>
													<button class="item" data-toggle="tooltip"
														data-placement="top" title="Delete">
														<a href="/admin/manufacture/delete/${manu.manuId}" onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục này không?');"> <i
															class="zmdi zmdi-delete"></i>
														</a>
													</button>
													<button class="item" data-toggle="tooltip"
														data-placement="top" title="More">
														<i class="zmdi zmdi-more"></i>
													</button>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- END DATA TABLE -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		function readURL(input, event, number) {
			if (input.files && input.files[0]) {
				var output = document.getElementById('imagePreview' + number);
				output.src = URL.createObjectURL(event.target.files[0]);
				output.onload = function() {
					URL.revokeObjectURL(output.src) // free memory
				}
			}
		}

		function clickHex(ele) {
			ele.type = "color";
			ele.value = "#ffffff";
			ele.click();

		}
	</script>
</body>
</html>

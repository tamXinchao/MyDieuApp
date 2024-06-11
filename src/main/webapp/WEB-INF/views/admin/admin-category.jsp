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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
.table img {
	max-width: 100%;
	max-height: 100px;
	width: auto;
	height: auto;
}

.image-preview {
	width: 200px;
	height: 250px;
	border: 4px solid #007bff;
	display: flex;
	align-items: center;
	justify-content: center;
	overflow: hidden;
	margin: auto;
}

.image-preview img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.custom-file-label::after {
	content: "Browse";
}
</style>
</head>
<body>
	<div class="container mt-5" style="padding-top: 10px" >
		<h1 class="text-center mb-4 mt-5">Edit Category</h1>
		<div class="card mt-5">
			<div class="card-body">
			<c:if test="${not empty alert}">
                    <div class="alert alert-danger">
                        ${alert}
                    </div>
                </c:if>
				<form:form action="/admin/edit-category" method="post"
					class="form-material" enctype="multipart/form-data"
					modelAttribute="category">
					<div class="row">
						<div class="col-md-4 text-center">
							<div class="image-preview mt-2">
								<img src="/user/img/${category.image}"
									id="imagePreview" />
							</div>
							<div class="custom-file mt-3">
								<input type="file" name="file" class="custom-file-input"
									id="fileInput"> <label class="custom-file-label"
									for="fileInput">Choose file</label>
							</div>
						</div>
						<div class="col-md-8">
							<form:hidden path="cateId" />
							<div class="form-group">
								<form:label path="name" cssClass="form-label">CategoryName</form:label>
								<form:input path="name" cssClass="form-control" />
								<form:errors path="name" element="div" class="text-danger"></form:errors>	
							</div>
							<div class="form-group">
								<form:label path="image" cssClass="form-label">ImageName</form:label>
								<form:input path="image" cssClass="form-control" />
								<form:errors path="image" element="div" class="text-danger"></form:errors>									
							</div>
						</div>
					</div>
					<div class="mt-3 row">
						<div class="col-sm-4">
							<form:button class="btn btn-primary w-100 font-weight-bold"
								formaction="/admin/category/create">Create</form:button>
						</div>
						<div class="col-sm-4">
							<form:button class="btn btn-warning w-100 font-weight-bold"
								formaction="/admin/category/update">Update</form:button>
						</div>
						<div class="col-sm-4">
							<form:button class="btn btn-secondary w-100 font-weight-bold"
								formaction="/admin/edit-category">Reset</form:button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>

	<div class="container mt-5">
		<h3 class="title-5 mb-4">Data Table</h3>
		<div class="table-responsive">
			<table class="table table-bordered table-striped">
				<thead>
					<tr>
						<th>STT</th>
						<th>CategoryName</th>
						<th>ID</th>
						<th>Image</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="cate" items="${categories}" varStatus="index">
						<tr>
							<td>${index.index + 1}</td>
							<td>${cate.name}</td>
							<td>${cate.cateId}</td>
							<td><img src="/user/img/${cate.image}" class="img-fluid" /></td>
							<td>
								<div class="table-data-feature">
									<button class="item" data-toggle="tooltip" data-placement="top"
										title="Edit">
										<a href="/admin/category/edit/${cate.cateId}"> <i
											class="zmdi zmdi-edit"></i>
										</a>
									</button>
									<button class="item" data-toggle="tooltip" data-placement="top"
										title="Delete">
										<a href="/admin/category/delete/${cate.cateId}"> <i
											class="zmdi zmdi-delete"></i>
										</a>
									</button>
									<button class="item" data-toggle="tooltip" data-placement="top"
										title="More">
										<i class="zmdi zmdi-more"></i>
									</button>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$('#fileInput').on('change', function() {
				var file = this.files[0];
				if (file) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$('#imagePreview').attr('src', e.target.result);
					}
					reader.readAsDataURL(file);
				}
				var fileName = $(this).val().split('\\').pop();
				$(this).next('.custom-file-label').html(fileName);
			});
		});
	</script>
</body>
</html>

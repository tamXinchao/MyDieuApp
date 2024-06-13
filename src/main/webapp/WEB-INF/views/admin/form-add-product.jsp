<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="main-content">
	<div class="section__content section__content--p30">
		<!-- Main-body start -->
		<div class="container-fluid">
			<div class="page-wrapper">
				<!-- Page-body start -->
				<div class="page-body" id="main_content">
					<div class="card">
						<div class="card-header">
							<h5>Thêm Sản Phẩm</h5>
						</div>
						<div class="card-block">
							<form method="post" class="form-material" id="productForm"
								action="/admin/add-product" enctype="multipart/form-data">
								<input type="hidden" name="id" value="${product.productId}" />
								<div class="row">
									<div class="col-md-4 text-center">
										<label for="image1_1" class="border border-primary mt-2"
											style="border-width: 4px !important; width: 200px; height: 250px; display: inline-block; cursor: pointer;">
											<img src="/user/img/${product.image}" id="imagePreview1_1"
											class="over"
											style="width: 100%; height: 100%; object-fit: cover;" />
										</label> <input type="file" class="custom-file-input image"
											style="display: none;" id="image1_1" name="imgProduct"
											accept=".jpg,.png,.jpeg"
											onchange="readURL(this, 'imagePreview1_1')">

										<p class="mt-4 font-weight-bold" style="font-size: 20px;">Choose
											Image</p>
									</div>

									<div class="col-md-8">
										<div class="form-group form-primary">
											<label>Tên Sản Phẩm</label> <input type="text"
												name="productName" value="${product.productName}"
												class="form-control">
										</div>
										<div class="row">
											<div class="col-sm-6">
												<div class="form-group form-primary">
													<label>Loại Sản Phẩm</label> <select name="categoryId"
														class="form-control">
														<option value=""></option>
														<c:forEach items="${categories}" var="category">
															<option value="${category.cateId}"
																${category.cateId == product.category.cateId ? 'selected' : ''}>
																${category.name}</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group form-primary">
													<label>Xuất Xứ</label> <input type="text" name="origin"
														value="${product.origin}" class="form-control">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-6">
												<div class="form-group form-primary">
													<label>Thương Hiệu</label> <select name="manuId" id="manu"
														class="form-control">
														<option value="">Chọn Thương Hiệu</option>
														<c:forEach items="${manu}" var="manu">
															<option value="${manu.manuId}"
																${manu.manuId == product.manufacturer.manuId ? 'selected' : ''}>
																${manu.manuName}</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group form-primary">
													<label>Chất Liệu</label> <input type="text" name="material"
														value="${product.material}" class="form-control">
												</div>
											</div>
										</div>
										<div class="form-group form-primary">
											<label>Description</label>
											<textarea name="describe" class="form-control w-100"
												style="height: 100px;" rows="5">${product.describe}</textarea>
										</div>
									</div>
								</div>
								<div class="row text-center" id="color-block">
									<div class="col-12" style="border-top: 2px solid #d7dce0;">
										<div class="row">
											<c:if test="${not empty images}">
												<div class="col-12 row px-5 mt-3 mb-4 text-left">
													<div class="col-sm-3 px-0">
														<h3 class="my-0 mt-2">Image</h3>
													</div>
												</div>
												<!-- Display all images -->
												<c:forEach var="img_color" items="${images}">
													<div class="col-sm-6 col-md-4 col-xl-3">
														<label for="image_${fn:escapeXml(img_color[2])}"
															class="border border-primary mt-2"
															style="border-width: 4px !important; width: 200px; height: 250px;">
															<img src="/user/img/${img_color[1]}"
															id="imagePreview_${fn:escapeXml(img_color[2])}"
															class="over"
															style="width: 100%; height: 100%; object-fit: cover;" />
														</label> <input type="file" class="custom-file-input image"
															style="height: 0;"
															id="image_${fn:escapeXml(img_color[2])}" name="images"
															onchange="readURL(this,'imagePreview_${fn:escapeXml(img_color[2])}')">
													</div>
												</c:forEach>

											</c:if>
										</div>
									</div>
								</div>
								<div class="mt-3 row">
									<div class="col-sm-3">
										<button type="button" onclick="addcolor()"
											class="btn btn-success w-100 font-weight-bold">
											<i class="fa fa-plus"></i> Thêm Ảnh
										</button>
									</div>
									<div class="col-sm-3">
										<button type="submit"
											class="btn btn-primary w-100 font-weight-bold"
											${isUpdate ? 'disabled' : ''}>Thêm</button>
									</div>

									<div class="col-sm-3">
										<button
											formaction="/admin/update-product/${product.productId}"
											${formIncomplete ? 'disabled' : ''}
											class="btn btn-warning w-100 font-weight-bold">Cập
											Nhật</button>
									</div>
									<div class="col-sm-3">
										<a href="/admin/reset"
											class="btn btn-primary w-100 font-weight-bold">Làm Mới</a>
									</div>
								</div>
							</form>
						</div>
					</div>

					<!-- Page-body end -->
				</div>
				<div id="styleSelector"></div>
			</div>
		</div>
	</div>
</div>
<script>
	function readURL(input, imagePreviewId) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				var imgElement = document.getElementById(imagePreviewId);
				if (imgElement) {
					imgElement.src = e.target.result;
				} else {
					console.error("Element with ID '" + imagePreviewId
							+ "' not found.");
				}
			}

			reader.readAsDataURL(input.files[0]); // convert to base64 string
		}
	}
</script>


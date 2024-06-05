<%@ page language="java" pageEncoding="UTF-8"%>
<div class="main-content">
	<div class="section__content section__content--p30">
		<!-- Main-body start -->
		<div class="container-fluid">
			<div class="page-wrapper">
				<!-- Page-body start -->
				<div class="page-body" id="main_content">
					<div class="card">
						<div class="card-header">
							<h5>Form Add Product</h5>
							<!--<span>Add class of <code>.form-control</code> with <code>&lt;input&gt;</code> tag</span>-->
						</div>
						<div class="card-block">
							<form action="/admin/add-product" method="post"
								class="form-material" id="productForm"
								enctype="multipart/form-data">
								<div class="row">
									<div class="col-md-4 text-center">
										<label for="thumbnail" class="border border-primary mt-2"
											style="border-width: 4px !important; width: 200px; height: 250px;">
											<img src="/manager/assets/images/no_image.jpg"
											id="imagePreview" class="over " />
										</label> <input type="file" class="custom-file-input"
											style="height: 0;" id="thumbnail" name="thumbnail"
											accept=".jpg,.png,.jpeg" onchange="readURL(this,event,'')">
										<p class="mt-4 font-weight-bold" style="font-size: 20px;">
											Choose Image</p>
									</div>
									<div class="col-md-8">
										<div class="form-group form-primary">
											<input type="text" name="name" class="form-control">
											<span class="form-bar"></span> <label class="float-label">Tên
												Thể Loại</label>
										</div>
										<div class="row">
											<div class="col-sm-8">
												<div class="form-group form-primary">
													<input type="text" name="xuatXu" class="form-control">
													<span class="form-bar"></span> <label class="float-label">Name
														Image</label>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="mt-3 row">
									<div class="col-sm-4">
										<button class="btn btn-primary w-100 font-weight-bold">Create</button>
									</div>
									<div class="col-sm-4">
										<button class="btn btn-warning w-100 font-weight-bold">Update</button>
									</div>
									<div class="col-sm-4">
										<button class="btn btn-primary w-100 font-weight-bold">Reset</button>
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
								<select class="js-select2" name="type">
									<option selected="selected">Export</option>
									<option value="">Option 1</option>
									<option value="">Option 2</option>
								</select>
								<div class="dropDownSelect2"></div>
							</div>
						</div>
					</div>
					<div class="table-responsive table-responsive-data2">
						<table class="table table-data2">
							<thead>
								<tr>
									<th>STT</th>
									<th>ID</th>
									<th>Tên Thể Loại</th>
									<th>Image</th>
								</tr>
							</thead>
							<tbody>
								<tr class="tr-shadow">
									<td>1</td>
									<td>1</td>
									<td>Giày Cao gót abc</td>
									<td>Việt nam</td>
									<td>
										<div class="table-data-feature">
											<button class="item" data-toggle="tooltip"
												data-placement="top" title="Edit">
												<i class="zmdi zmdi-edit"></i>
											</button>
											<button class="item" data-toggle="tooltip"
												data-placement="top" title="Delete">
												<i class="zmdi zmdi-delete"></i>
											</button>
											<button class="item" data-toggle="tooltip"
												data-placement="top" title="More">
												<i class="zmdi zmdi-more"></i>
											</button>
										</div>
									</td>
								</tr>
								<tr class="spacer"></tr>
								<tr class="tr-shadow">
									<td>1</td>
									<td>1</td>
									<td>Giày Cao gót abc</td>
									<td>Việt nam</td>
									<td>
										<div class="table-data-feature">
											<button class="item" data-toggle="tooltip"
												data-placement="top" title="Edit">
												<i class="zmdi zmdi-edit"></i>
											</button>
											<button class="item" data-toggle="tooltip"
												data-placement="top" title="Delete">
												<i class="zmdi zmdi-delete"></i>
											</button>
											<button class="item" data-toggle="tooltip"
												data-placement="top" title="More">
												<i class="zmdi zmdi-more"></i>
											</button>
										</div>
									</td>
								</tr>
								<tr class="spacer"></tr>
								<tr class="tr-shadow">
									<td>1</td>
									<td>1</td>
									<td>Giày Cao gót abc</td>
									<td>Việt nam</td>
								
									<td>
										<div class="table-data-feature">
											<button class="item" data-toggle="tooltip"
												data-placement="top" title="Edit">
												<i class="zmdi zmdi-edit"></i>
											</button>
											<button class="item" data-toggle="tooltip"
												data-placement="top" title="Delete">
												<i class="zmdi zmdi-delete"></i>
											</button>
											<button class="item" data-toggle="tooltip"
												data-placement="top" title="More">
												<i class="zmdi zmdi-more"></i>
											</button>
										</div>
									</td>
								</tr>
								<tr class="spacer"></tr>
								<tr class="tr-shadow">
									<td>1</td>
									<td>1</td>
									<td>Giày Cao gót abc</td>
									<td>Việt nam</td>
									<td>
										<div class="table-data-feature">
											<button class="item" data-toggle="tooltip"
												data-placement="top" title="Edit">
												<i class="zmdi zmdi-edit"></i>
											</button>
											<button class="item" data-toggle="tooltip"
												data-placement="top" title="Delete">
												<i class="zmdi zmdi-delete"></i>
											</button>
											<button class="item" data-toggle="tooltip"
												data-placement="top" title="More">
												<i class="zmdi zmdi-more"></i>
											</button>
										</div>
									</td>
								</tr>
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
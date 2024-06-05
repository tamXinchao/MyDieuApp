<%@ page language="java" pageEncoding="UTF-8"%>
<!--FORM-->
<jsp:include page="form-add-product.jsp"></jsp:include>
<!--FORM-->
<!-- MAIN CONTENT-->
<div class="main-content" style="margin-top: -150px">
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
									<th>name</th>
									<th>Xuất Xứ</th>
									<th>Chất Liệu</th>
									<th>Thương Hiệu</th>
									<th>Thể Loại</th>
									<th>Ngày Nhập</th>
									<th>description</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr class="tr-shadow">
									<td>1</td>
									<td>Giày Cao gót abc</td>
									<td>Việt nam</td>
									<td>Cao Su</td>
									<td>Vo Tan Thanh</td>
									<td>Giày Đế nhọn</td>
									<td>Ngày Hom Nay</td>
									<td>null</td>
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
									<td>Giày Cao gót abc</td>
									<td>Việt nam</td>
									<td>Cao Su</td>
									<td>Vo Tan Thanh</td>
									<td>Giày Đế nhọn</td>
									<td>Ngày Hom Nay</td>
									<td>null</td>
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
									<td>Giày Cao gót abc</td>
									<td>Việt nam</td>
									<td>Cao Su</td>
									<td>Vo Tan Thanh</td>
									<td>Giày Đế nhọn</td>
									<td>Ngày Hom Nay</td>
									<td>null</td>
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
									<td>Giày Cao gót abc</td>
									<td>Việt nam</td>
									<td>Cao Su</td>
									<td>Vo Tan Thanh</td>
									<td>Giày Đế nhọn</td>
									<td>Ngày Hom Nay</td>
									<td>null</td>
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

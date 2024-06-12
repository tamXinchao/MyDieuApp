<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!--FORM-->
<jsp:include page="form-add-product.jsp"></jsp:include>

<!--FORM-->
<!-- MAIN CONTENT-->
<style>
.modal-backdrop.show {
	z-index: -1;
}
</style>

<div class="main-content" style="margin-top: -150px">
	<div class="section__content section__content--p30">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<!-- DATA TABLE -->
					<div class="table-data__tool">
						<div class="table-data__tool-left d-flex">
							<form action="/admin/tableEditProduct" method="get">
							    <div class="input-group">
							        <input type="text" name="productName" class="form-control" placeholder="Search by product name">
							        <input type="date" name="ngayNhap" class="form-control">
							        <div class="input-group-append">
							            <button type="submit" class="input-group-text bg-transparent text-primary">
							                <i class="fa fa-search"></i>
							            </button>
							        </div>
							    </div>
							</form>



						</div>
						<div class="table-data__tool-right">
							<a href="/product/exportToExcel"><button
									class="btn btn-secondary">Export Excel</button></a>

						</div>
					</div>
					<div class="table-responsive table-responsive-data2">
						<table class="table table-data2">
							<thead>
								<tr>
									<th>STT</th>
									<th><a
										href="/admin/tableEditProduct?field=productName&page=${currentPage}&sortDir=${sortField == 'productName' ? (sortDir == 'asc' ? 'desc' : 'asc') : 'asc'}">
											Name ${sortField == 'productName' ? (sortDir == 'asc' ? '▲' : '▼') : ''}
									</a></th>
									<th>Xuất Xứ</th>
									<th>Chất Liệu</th>
									<th>Thương Hiệu</th>
									<th>Thể Loại</th>
									<th><a
										href="/admin/tableEditProduct?field=ngayNhap&page=${currentPage}&sortDir=${sortField == 'ngayNhap' ? (sortDir == 'asc' ? 'desc' : 'asc') : 'asc'}">
											Ngày Nhập ${sortField == 'ngayNhap' ? (sortDir == 'asc' ? '▲' : '▼') : ''}
									</a></th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="p" items="${products.content}" varStatus="loop">
									<c:set var="psc" value="${productSCMap[p.productId]}" />
									<tr class="spacer"></tr>
									<tr class="tr-shadow">
										<td scope="row">${(currentPage - 1) * pageSize + loop.index + 1 }</td>
										<td name="productId">${p.productName}</td>
										<td>${p.origin}</td>
										<td>${p.material}</td>
										<td>${p.manufacturer.manuName}</td>
										<td>${p.category.name}</td>
										<td>${p.ngayNhap}</td>
										<td>
											<div class="table-data-feature">
												<a href="/admin/edit-product/${p.productId}">
													<button class="item" data-toggle="tooltip"
														data-placement="top" title="Edit">
														<i class="zmdi zmdi-edit"></i>
													</button>
												</a>
												<button type="button" class="item delete-btn"
													data-toggle="modal"
													data-target="#deleteModal-${p.productId}">
													<i class="zmdi zmdi-delete"></i>
												</button>

												<a class="item" data-toggle="tooltip"
													href="/admin/product-quality/${p.productId}"
													data-placement="top" title="More"> <i
													class="zmdi zmdi-more"></i>
												</a>

												<!-- Delete Confirmation Modal -->
												<div class="modal fade" id="deleteModal-${p.productId}"
													tabindex="-1" role="dialog"
													aria-labelledby="exampleModalLabel-${p.productId}"
													aria-hidden="true">
													<div class="modal-dialog" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title"
																	id="exampleModalLabel-${p.productId}">Confirm
																	Delete</h5>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">Bạn có muốn xóa sản phẩm
																"${p.productName}" không ?</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary"
																	data-dismiss="modal">Cancel</button>
																<a type="button" href="/admin/delete-product"
																	class="btn btn-danger confirm-delete-btn"
																	data-id="${p.productId}">Delete</a>
															</div>
														</div>
													</div>
												</div>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>


						<div class="col-12 pb-1">
							<nav aria-label="Page navigation">
								<ul class="pagination justify-content-center mb-3">
									<li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
										<a class="page-link" href="?page=${currentPage - 1}"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
											<span class="sr-only">Previous</span>
									</a>
									</li>
									<c:forEach var="i" begin="1" end="${totalPages}">
										<li class="page-item ${i == currentPage ? 'active' : ''}">
											<a class="page-link" href="?page=${i}">${i}</a>
										</li>
									</c:forEach>
									<li
										class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
										<a class="page-link" href="?page=${currentPage + 1}"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
											<span class="sr-only">Next</span>
									</a>
									</li>
								</ul>
							</nav>
						</div>
					</div>
					<!-- END DATA TABLE -->
				</div>
			</div>
		</div>
	</div>
</div>
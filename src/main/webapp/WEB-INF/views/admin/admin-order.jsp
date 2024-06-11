<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="main-content">
	<div class="section__content section__content--p30">
		<!-- Main-body start -->
		<div class="container-fluid">
			<div class="page-wrapper">
				<!-- Page-body start -->
				<div class="page-body" id="main_content">
					<!-- Search -->
					<div class="card">
						<div class="card-header">
							<form class="form-header" action="" method="POST">
								<input class="au-input au-input--xl" type="text" name="search"
									placeholder="Id đơn hàng, họ tên,..." />
								<button class="au-btn--submit" type="submit">
									<i class="zmdi zmdi-search"></i>
								</button>
							</form>
						</div>
					</div>
					<!-- Basic table card start -->
					
					<div class="card">
						<div class="card-header fw-bold">
							<h5>${title}</h5>
							<div class="card-header-right"></div>
						</div>
						<div class="card-body bg-transparent table-border-style">
							<div class="table-responsive">
								<table class="table" id="table-edit">
									<thead>
										<tr>
											<th>#</th>
											<th>Họ tên</th>
											<th>Số điện thoại</th>
											<th>Ngày đặt hàng</th>
											<th>Tổng tiền</th>
											<th>Xem</th>
											<th>Xác nhận</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="order" items="${listOrder}" varStatus="loop">
											<tr>
												<th>${loop.index+1}</th>
												<td>${order.user.fullname}</td>
												<td>${order.address.phoneNumber}</td>
												<td>${order.date}</td>
												<td class="text-success">
													<fmt:formatNumber value="${order.totalAmount}" type="number" /> đ
												</td>
												<td>
													<a href="/admin/form-admin-order-confirm-detail/${order.orderId}" class="btn bg-warning py-1 px-3 rounded-pill">
													 Detail <i class="fa fa-arrow-right"></i>
													</a>
												</td>
												<td>
													<a href="#" class="btn bg-success py-1 px-3 rounded-pill">
														 Xác nhận <i class="fa fa-check"></i>
													</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="card-footer" style="border-top: 2px solid #d7dce0;">
							<nav aria-label="Page navigation example"
								class=" d-flex justify-content-between">
								<ul class="pagination" id="pageNumber">
									<li class="page-item">
										<button class="btn page-link" onclick="select(this,0)">First</button>
									</li>
									<li class="page-item"><button class="btn page-link"
											onclick="select(this,0)">Prev</button></li>
									<li class="page-item"><button class="btn page-link">1/1</button></li>
									<li class="page-item"><button class="btn page-link"
											onclick="select(this,0)">Next</button></li>
									<li class="page-item">
										<button class="btn page-link" onclick="select(this,0)">Last</button>
									</li>
								</ul>
							</nav>
						</div>
					</div>
					<!-- Basic table card end -->
				</div>

				<!-- Page-body end -->
			</div>
			<div id="styleSelector"></div>
		</div>
	</div>
</div>
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
						<div class="card-header row">
							<div class="col-5">
								<form class="form-header" action="/admin/order-confirm-search" method="POST">
									<input class="au-input au-input--xl" type="text" name="search"
										placeholder="Id đơn hàng, họ tên,..." />
									<button class="au-btn--submit" type="submit">
										<i class="zmdi zmdi-search"></i>
									</button>
								</form>
							</div>
							<div class="col-4">
								<form class="form-header" action="/admin/order-confirm-search-date" method="GET">
									<label style="margin-top: 12px; margin-right: 7px;">Từ</label>
									<input class="au-input" type="date" name="date1" placeholder="Từ ngày" />
									<label style="margin-top: 12px; margin-right: 7px; margin-left: 7px;">Đến</label>
									<input class="au-input" type="date" name="date2" placeholder="Đến ngày" >
									<button class="au-btn--submit" type="submit">
										<i class="zmdi zmdi-search"></i>
									</button>
								</form>
							</div>
							<div class="col-3">
								<form class="d-flex justify-content-end">
									<button class="btn btn-success" type="button" onclick="notification()">
										<i class="far fa-file-excel"></i> Xuất excel
									</button>
								</form>
							</div>
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
											<th>Mặt hàng</th>
											<th>Tổng tiền</th>
											<th>Xem</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="order" items="${listOrder}" varStatus="loop">
											<tr>
												<th>${order.orderId}</th>
												<td>${order.user.fullname}</td>
												<td>${order.address.phoneNumber}</td>
												<td>
													<fmt:formatDate value="${order.date}"
														pattern="HH:mm:ss dd/MM/yyyy" />
												</td>
												<td>
													<c:forEach var="item" items="${listCountOrderDetail}">
														<c:if test="${item.orderId == order.orderId}">
															${item.countOrderDetail}
														</c:if>
													</c:forEach>
												</td>
												<td class="text-success">
													<fmt:formatNumber value="${order.totalAmount}" type="number" />
													đ
												</td>
												<td>
													<a href="/admin/form-admin-order-confirm-detail/${order.orderId}"
														class="btn bg-warning py-1 px-3 rounded-pill">
														Chi tiết <i class="fa fa-arrow-right"></i>
													</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="card-footer" style="border-top: 2px solid #d7dce0;">
							<nav aria-label="Page navigation example" class=" d-flex justify-content-between">
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

<!-- Modal -->
<div class="modal fade" id="notic" tabindex="-1" role="dialog" aria-labelledby="confirmationModalLabel"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="confirmationModalLabel">Thông báo</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				Đã xuất excel
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="closeModal">Đóng</button>
			</div>
		</div>
	</div>
</div>
<script>
	document.getElementById('closeModal').addEventListener('click', function () {
		// Redirect after modal is closed
		window.location.href = '/admin/form-admin-order-confirm'
	});
    function notification() {
    	$.ajax({
            url: '/export-to-excel',
            type: 'GET',
            success: function(response) {
                // Hiển thị modal khi nhận được phản hồi thành công
            	$('#notic').modal('show');
            },
            error: function(xhr, status, error) {
                // Xử lý lỗi nếu có
                alert('Có lỗi xảy ra: ' + error);
            }
        });
    	
    }
</script>
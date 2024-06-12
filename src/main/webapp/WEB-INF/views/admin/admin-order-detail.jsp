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
					<!-- Basic table card start -->
					<div class="card">
						<div class="card-header row">
							<div class="col-5">
								<h5>
									<input id="orderId" value="${order.orderId}" type="hidden">
									Hóa đơn chi tiết của ${order.user.fullname} <label
										class="badge badge-info p-2 ml-3">${order.status}</label>
								</h5>
								<br>
								<h5>
									Ngày đặt:
									<fmt:formatDate value="${order.date}"
										pattern="HH:mm:ss dd/MM/yyyy" />
								</h5>
							</div>
							<div class="col-4 ">

								<h5 style="font-size: 15px">
									Địa chỉ: <b>${order.address.address}</b>
								</h5>
								<br>
								<br>


								<h5 style="font-size: 15px">Tỉnh:
									${order.address.provincial}</h5>

							</div>

							<div class="col-3">
								<h5 style="font-size: 15px">SĐT:
									${order.address.phoneNumber}</h5>

								<br>
								<br>

								<h5 style="font-size: 15px">Email: ${order.address.email}</h5>
							</div>
						</div>
						<div class="card-body bg-transparent table-border-style">
							<div class="table-responsive">
								<table class="table" id="table-edit">
									<thead>
										<tr>
											<th width="5%">STT</th>
											<th width="35%">Tên sản phẩm</th>
											<th width="18%">Màu / Kích cỡ</th>
											<th width="10%">Số lượng</th>
											<th width="15%">Giá</th>
											<th width="17%">Thành tiền</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="orderDetail" items="${listOrderDetail}"
											varStatus="loop">
											<tr>
												<th>${loop.index+1}</th>
												<td class="text-info"><img
													src="/user/img/${orderDetail.productSizeColor.product.image}"
													class="rounded-circle" style="width: 50px; height: 50px;">
													${orderDetail.productSizeColor.product.productName}</td>
												<td>${orderDetail.productSizeColor.color.name}/
													${orderDetail.productSizeColor.size.name}</td>
												<td>${orderDetail.quality}</td>
												<td><fmt:formatNumber
														value="${orderDetail.productSizeColor.price}"
														type="number" /> đ</td>
												<td class="text-success"><fmt:formatNumber
														value="${orderDetail.productSizeColor.price * orderDetail.quality}"
														type="number" /> đ</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="card-footer" style="border-top: 2px solid #d7dce0;">
							<nav aria-label="Page navigation example"
								class="d-flex justify-content-between">
								<div class="mr-3">
									<button class="btn btn-secondary py-1 px-3 rounded-pill mr-3"
										onclick="history.back()">
										<i class="fa fa-arrow-left"></i> Trở lại danh sách
									</button>
									<a href="#" onclick="confirmToPending(${order.orderId})"
										class="btn btn-success mr-3 py-1 px-3 rounded-pill"> Xác
										nhận <i class="fa fa-check"></i>
									</a>
									<button type="button"
										class="btn btn-danger py-1 px-3 rounded-pill"
										data-toggle="modal" data-target="#refuse">
										Từ chối <i class="fa fa-times "></i>
									</button>
								</div>
								<div class="d-inline-flex align-items-center">
									<span class="font-weight-bold ml-5 mr-2"
										style="font-size: 16px">Tổng:</span> <span class="mr-2"
										style="font-size: 16px"> <fmt:formatNumber
											value="${order.totalAmount}" type="number" /> đ
									</span>
								</div>
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
<div class="modal fade" id="confirmationModal" tabindex="-1"
	role="dialog" aria-labelledby="confirmationModalLabel"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="confirmationModalLabel">Thông báo</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">Đơn hàng ${order.orderId} đã được xác
				nhận và chuyển sang trạng thái 'Đang chuẩn bị'.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="closeModal">Đóng</button>
			</div>
		</div>
	</div>
</div>

<!-- modal refuse -->
<div class="modal fade" id="refuse" tabindex="-1"
	aria-labelledby="refuseLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="refuseLabel">Từ chối nhận đơn</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>Bạn muốn từ chối đơn hàng ${order.orderId}.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal"
					id="close">Hủy</button>
				<a href="" type="button" class="btn btn-primary">Từ chối</a>
			</div>
		</div>
	</div>
</div>

<script>
	// Add event listener to the modal close button
	document.getElementById('closeModal').addEventListener('click', function () {
		// Redirect after modal is closed
		window.location.href = '/admin/form-admin-order-confirm'
	});
	function confirmToPending(orderId) {
		$.ajax({
			url: '/admin/confirm-to-pending/' + orderId,
			type: 'GET',
			success: function (response) {
				// Hiển thị modal khi nhận được phản hồi thành công
				$('#confirmationModal').modal('show');
			},
			error: function (xhr, status, error) {
				// Xử lý lỗi nếu có
				alert('Có lỗi xảy ra: ' + error);
			}
		});

		
	}
</script>
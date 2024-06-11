<!-- <%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%> -->
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
									Hóa đơn chi tiết của ${order.user.fullname}
									<label class="badge badge-info p-2 ml-3"
										style="font-size: 12px;">${order.status}</label>
								</h5>
								<span>Ngày đặt: ${order.date}</span>
							</div>
							<div class="col-7 d-inline-flex">
								<div>
									<label style="font-size: 15px">Địa chỉ: </label>
									<span class="font-weight-bold" style="font-size: 15px">
										${order.address.address}
									</span>

									<label style="font-size: 15px">Tỉnh: </label>
									<span class="font-weight-bold" style="font-size: 15px">
										${order.address.provincial}
									</span>
								</div>
								<div>
									<label style="font-size: 15px">SĐT: </label>
									<span class="font-weight-bold" style="font-size: 15px">
										${order.address.phoneNumber}
									</span>
									<label style="font-size: 15px">Email: </label>
									<span class="font-weight-bold" style="font-size: 15px">
										${order.address.email}
									</span>
								</div>
							</div>
						</div>
						<div class="card-body bg-transparent table-border-style">
							<div class="table-responsive">
								<table class="table" id="table-edit">
									<thead>
										<tr>
										</tr>
										<tr>
											<th width="5%">STT</th>
											<th width="35%">Tên sản phẩm</th>
											<th width="18%">Màu / Kích cỡ</th>
											<th width="10%">Số lượng</th>
											<th width="15%">Giá</th>
											<th width="17%">Thành tiền </th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="orderDetail" items="${listOrderDetail}" varStatus="loop">
											<tr>
												<th>${loop.index+1}</th>
												<td class="text-info">
													<img src="" class="rounded-circle"
														style="width: 50px; height: 50px;">
													${orderDetail.productSizeColor.product.productName}
												</td>
												<td>${orderDetail.productSizeColor.color.name}
													/ ${orderDetail.productSizeColor.size.name}</td>
												<td>${orderDetail.quality}</td>
												<td>
													<fmt:formatNumber value="${orderDetail.productSizeColor.price}"
														type="number" /> đ
												</td>
												<td class="text-success">
													${orderDetail.productSizeColor.price*orderDetail.quality}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="card-footer" style="border-top: 2px solid #d7dce0;">
							<nav aria-label="Page navigation example" class=" d-flex justify-content-between">
								<div>
									<button class="btn btn-secondary font-weight-bold" onclick="history.back()">
										<i class="fa fa-arrow-left"></i> Back to order list
									</button>
								</div>
								<div class="d-inline-flex align-items-center">
									<span class="font-weight-bold ml-5 mr-2" style="font-size: 16px">Total Price:
									</span> <span class=" mr-2" style="font-size: 16px">600,000 VND</span>
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
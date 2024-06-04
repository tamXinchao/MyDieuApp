<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
	<!-- Page Header Start -->
	<div class="container-fluid bg-secondary mb-5">
		<div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 150px">
			<h1 class="font-weight-semi-bold text-uppercase mb-3">Shopping
				Cart</h1>
			<div class="d-inline-flex">
				<p class="m-0">
					<a href="">Home</a>
				</p>
				<p class="m-0 px-2">-</p>
				<p class="m-0">Shopping Cart</p>
			</div>
		</div>
	</div>

	<!-- Page Header End -->


	<!-- Cart Start -->
	<div class="container-fluid pt-5">
		<div class="row px-xl-5">
			<div class="col-lg-8 table-responsive mb-5">
				<table class="table table-bordered text-center mb-0">
					<thead class="bg-secondary text-dark">
						<tr>
							<th>Xóa</th>
							<th>Sản phẩm</th>
							<th>Giá</th>
							<th>Số lượng</th>
							<th>Thành tiền</th>
						</tr>
					</thead>
					<tbody class="align-middle">
					<c:forEach var="items" items="${listProInCart}">
						<tr>
							<td class="align-middle">
								<button class="btn btn-sm btn-primary">
									<i class="fa fa-times"></i>
								</button>
							</td>
							<td class="align-middle">
								<img src="/template/Product_Images/${items.productSizeColor.product.image}" alt="" style="width: 50px;">
								${items.productSizeColor.product.productName}</td>
							<td class="align-middle">
							<fmt:formatNumber value="${items.productSizeColor.price}" type="currency"
										currencyCode="VND" /></td>
							<td class="align-middle">
								<div class="input-group quantity mx-auto" style="width: 100px;">
									<div class="input-group-btn">
										<a class="btn btn-sm btn-primary btn-minus" href="/gio-hang/update/${items.id}/minus">
											<i class="fa fa-minus"></i>
										</a>
									</div>
									<input type="text" class="form-control form-control-sm bg-secondary text-center"
										value="${items.quality}">
									<div class="input-group-btn">
										<a class="btn btn-sm btn-primary btn-plus" href="/gio-hang/update/${items.id}/plus">
											<i class="fa fa-plus"></i>
										</a>
									</div>
								</div>
							</td>
							<td class="align-middle">
								<fmt:formatNumber value="${items.productSizeColor.price*items.quality}" type="currency"
										currencyCode="VND" />
										</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-lg-4">
				<form class="mb-5" action="">
					<div class="input-group">
						<input type="text" class="form-control p-4" placeholder="Mã giảm giá">
						<div class="input-group-append">
							<button class="btn btn-primary">Áp dụng</button>
						</div>
					</div>
				</form>
				<div class="card border-secondary mb-5">
					<div class="card-header bg-secondary border-0">
						<h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
					</div>
					<div class="card-body">
						<div class="d-flex justify-content-between mb-3 pt-1">
							<h6 class="font-weight-medium">Subtotal</h6>
							<h6 class="font-weight-medium">$150</h6>
						</div>
						<div class="d-flex justify-content-between">
							<h6 class="font-weight-medium">Shipping</h6>
							<h6 class="font-weight-medium">$10</h6>
						</div>
					</div>
					<div class="card-footer border-secondary bg-transparent">
						<div class="d-flex justify-content-between mt-2">
							<h5 class="font-weight-bold">Total</h5>
							<h5 class="font-weight-bold">$160</h5>
						</div>
						<button class="btn btn-block btn-primary my-3 py-3">Proceed
							To Checkout</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Cart End -->
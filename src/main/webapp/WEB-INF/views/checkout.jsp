<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
	.form-select {
	    display: block;
	    width: 100%;
	    padding: 0.375rem 2.25rem 0.375rem 0.75rem;
	    font-size: 1rem;
	    font-weight: 400;
	    line-height: 1.5;
	    color: #212529;
	    background-color: #fff;
	    background-clip: padding-box;
	    border: 1px solid #ced4da;
	    border-radius: 0.25rem;
	    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	}
	
	.form-select:focus {
	    border-color: #80bdff;
	    outline: 0;
	    box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
	}
</style>
<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-3">
	<div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 150px">
		<h1 class="font-weight-semi-bold text-uppercase mb-3">Đặt hàng</h1>
		<div class="d-inline-flex">
			<p class="m-0">
				<a href="">Trang chủ</a>
			</p>
			<p class="m-0 px-2">-</p>
			<p class="m-0">Đặt hàng</p>
		</div>
	</div>
</div>

<!-- Page Header End -->

<!-- Checkout Start -->
<form action="/checkout" method="post">
	<div class="container-fluid p-2">
		<div class="row px-xl-5">
			<div class="col-lg-7 mb-3">
				<form class="mb-5" action="">
					<div class="input-group">
						<input type="text" class="form-control p-4" placeholder="Mã giảm giá">
						<div class="input-group-append">
							<button class="btn btn-primary">Áp dụng</button>
						</div>
					</div>
				</form>
				<div class="card border-secondary mb-5 mt-4">
					<div class="card-header bg-secondary border-0">
						<h4 class="font-weight-semi-bold m-0">Hóa Đơn Chi Tiết</h4>
					</div>
					<div class="card-body">
						<div class="mb-2">
							<table class="table text-center mb-0">
								<thead class="text-dark">
									<tr>
										<th>Sản phẩm</th>
										<th>Số lượng</th>
										<th>Giá</th>
									</tr>
								</thead>
								<tbody class="align-middle">
									<c:forEach var="items" items="${listCheckOut}">
										<tr>
											<td class="">
												<lable>${items.productSizeColor.product.productName}</lable>
											</td>
											<td>${items.quality}</td>
											<td class="align-middle">
												<fmt:formatNumber type="number" pattern="###,###,###"
													value="${items.productSizeColor.price}" /> đ
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="card-body">
						<div class="d-flex justify-content-between mb-3 pt-1">
							<h6 class="font-weight-medium">Tạm tính</h6>
							<h6 class="font-weight-medium">
								<fmt:formatNumber value="${Amount}" type="number" /> đ
							</h6>
						</div>
						<div class="d-flex justify-content-between mb-3 pt-1">
							<h6 class="font-weight-medium">Sản phẩm</h6>
							<h6 class="font-weight-medium">${sp}</h6>
						</div>
						<div class="d-flex justify-content-between">
							<h6 class="font-weight-medium">Phí vận chuyển</h6>
							<h6 class="font-weight-medium">0 đ</h6>
						</div>
					</div>
					<div class="card-footer border-secondary bg-transparent text-center">
						<div class="d-flex justify-content-between mt-2">
							<h5 class="font-weight-bold">Tổng</h5>
							<h5 class="font-weight-bold">
								<fmt:formatNumber value="${Amount}" type="number" /> đ
							</h5>
						</div>
						<button class="btn btn-block btn-primary my-3 py-3 w-75 mx-auto">Thanh toán</button>
					</div>
				</div>
			</div>
			<div class="col-lg-5 mb-3">
				<div class="card border-secondary mb-5 ">
					<div class="card-header bg-secondary border-0">
						<h4 class="font-weight-semi-bold m-0">Địa chỉ</h4>
					</div>
					<div class="m-2">
						<%-- <select id="addressSelect" name="address" class="form-select" >
			                <c:forEach var="dc" items="${diachi}" varStatus="loop">
						        <option value="${dc.addressId}" ${loop.first ? 'selected' : ''}>${dc.address}</option>
						    </c:forEach>
			            </select> --%>
					
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-6 form-group">
								<label>Họ tên</label>
								<input class="form-control" value="${user.fullname}">
							</div>
							<div class="col-md-6 form-group">
								<label>Số điện thoại</label>
								<input class="form-control" value="${diachi.phoneNumber}">
							</div>
							<div class="col-md-12 form-group">
								<label>E-mail</label>
								<input class="form-control" value="${diachi.email}">
							</div>
							<div class="col-md-12 form-group">
								<label>Tỉnh </label>
								<input class="form-control" value="${diachi.provincial}">
							</div>
							<div class="col-md-12 form-group">
								<label>Địa chỉ</label>
								<input class="form-control" value="${diachi.address}">
							</div>
						</div>
					</div>
					<div class="card-footer border-secondary bg-transparent text-center">
						<a class="btn btn-block btn-primary my-3 py-3 w-50 mx-auto">Đổi địa chỉ</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<!-- Checkout End -->

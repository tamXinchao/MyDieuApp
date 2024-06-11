<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<title>Giỏ hàng</title>
<style>
	.link-detail:hover{
	    color: black;
	    text-decoration: none;
	}
	
</style>
	<!-- Page Header Start -->
	<div class="container-fluid bg-secondary mb-3">
		<div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 150px">
			<h1 class="font-weight-semi-bold text-uppercase mb-3">Giỏ hàng</h1>
			<div class="d-inline-flex">
				<p class="m-0">
					<a href="">Trang chủ</a>
				</p>
				<p class="m-0 px-2">-</p>
				<p class="m-0">Giỏ hàng</p>
			</div>
		</div>
	</div>

	<!-- Page Header End -->


	<!-- Cart Start -->
	<form action="/checkout" method="get" onsubmit="return validateForm()">
		<div class="container-fluid pt-2">
			<div class="row px-xl-5">
				<div class="col-lg-9 table-responsive mb-3">
					<table class="table table-bordered text-center mb-0">
						<thead class="bg-secondary text-dark">
							<tr>
								<th>	
									<input type="checkbox" id="selectAll"  checked> Tất cả
								</th>
								<th>Sản phẩm</th>
								<th>Giá</th>
								<th>Số lượng</th>
								<th>Thành tiền</th>
								<th>Xóa </th>
							</tr>
						</thead>
						<tbody class="align-middle">
						<c:forEach var="items" items="${listProInCart}">
							<tr>
								<td class="align-middle">
									  <input type="checkbox" name="selectedItems" value="${items.id}" id="item-${items.id}" checked/> 
								</td>
								
								<td class="text-start">

									<a href="/product/detail/${items.productSizeColor.product.productId}/${items.productSizeColor.product.category.cateId}" class="link-detail">

										<img src="/template/Product_Images/${items.productSizeColor.product.image}" alt="" style="width: 50px;">
										${items.productSizeColor.product.productName} <br>
									</a>
									<lable>Màu: ${items.productSizeColor.color.name}</lable>
									<lable>;    Kích cỡ: ${items.productSizeColor.size.name}</lable>
								</td>
								
								<td class="align-middle">
									<fmt:formatNumber value="${items.productSizeColor.price}" type="number" minFractionDigits="0" maxFractionDigits="0"/> đ
								</td>
								
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
									<fmt:formatNumber value="${items.productSizeColor.price*items.quality}" type="number"/> đ
								</td>
								<td class="align-middle">
									<a class="btn btn-sm btn-primary" href="/cart/delete/${items.id}">
										<i class="fa fa-times"></i>
									</a>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-lg-3">
				<!--  
					<form class="mb-5" action="">
						<div class="input-group">
							<input type="text" class="form-control p-4" placeholder="Mã giảm giá">
							<div class="input-group-append">
								<button class="btn btn-primary">Áp dụng</button>
							</div>
						</div>
					</form>
					-->
					<div class="card border-secondary mb-5 mt-4">
						<div class="card-header bg-secondary border-0">
							<h4 class="font-weight-semi-bold m-0">Tóm tắt</h4>
						</div>
						<div class="card-body">
							<div class="d-flex justify-content-between mb-3 pt-1">
								<h6 class="font-weight-medium">Tạm tính</h6>
								<h6 class="font-weight-medium">
									<fmt:formatNumber value="${Amount}" type="number"/> đ
								</h6>
							</div>
							<div class="d-flex justify-content-between mb-3 pt-1">
								<h6 class="font-weight-medium">Sản phẩm</h6>
								<h6 class="font-weight-medium">${Count}</h6>
							</div>
							<div class="d-flex justify-content-between">
								<h6 class="font-weight-medium">Phí vận chuyển</h6>
								<h6 class="font-weight-medium">0 đ</h6>
							</div>
						</div>
						<div class="card-footer border-secondary bg-transparent">
							<div class="d-flex justify-content-between mt-2">
								<h5 class="font-weight-bold">Tổng</h5>
								<h5 class="font-weight-bold">
									<fmt:formatNumber value="${Amount}" type="number"/> đ
								</h5>
							</div>
							<button class="btn btn-block btn-primary my-3 py-3">Thanh toán</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
<script>
    function validateForm() {
        var checkboxes = document.querySelectorAll('input[name="selectedItems"]:checked');
        if (checkboxes.length === 0) {
            alert('Vui lòng chọn ít nhất một mục.');
            return false;
        }
        return true;
    }
    document.addEventListener("DOMContentLoaded", function() {
        var selectAllCheckbox = document.getElementById("selectAll");
        var itemCheckboxes = document.querySelectorAll('input[name="selectedItems"]');

        selectAllCheckbox.addEventListener("change", function() {
            itemCheckboxes.forEach(function(checkbox) {
                checkbox.checked = selectAllCheckbox.checked;
            });
        });
    });
</script>
	<!-- Cart End -->
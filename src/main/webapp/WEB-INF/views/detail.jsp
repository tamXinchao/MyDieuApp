<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page pageEncoding="UTF-8"%>

<!-- Shop Detail Start -->
<form action="/cart/add" method="post" onsubmit="return validateForm()">
<div class="container-fluid py-5">
	<div class="row px-xl-5">
		<div class="col-lg-4 pb-5">
			<div id="product-carousel" class="carousel slide"
				data-ride="carousel">
				<div class="carousel-inner border">
					<c:forEach var="nameImg" items="${image}" varStatus="loop">
						<div
							class="carousel-item<c:if test="${loop.index == 0}"> active</c:if>">
							<img class="w-100 h-100" src="/user/img/${nameImg[0]}"
								alt="Image">
						</div>
					</c:forEach>

				</div>
				<a class="carousel-control-prev" href="#product-carousel"
					data-slide="prev"> <i class="fa fa-2x fa-angle-left text-dark"></i>
				</a> <a class="carousel-control-next" href="#product-carousel"
					data-slide="next"> <i class="fa fa-2x fa-angle-right text-dark"></i>
				</a>
			</div>
		</div>

		<div class="col-lg-7 pb-5">
			<c:forEach var="detail" items="${detail }">
				<h3 class="font-weight-semi-bold">${detail[0] }</h3>
				<br>
				<h3 class="font-weight-semi-bold">
					<fmt:formatNumber value="${detail[2]}" type="currency"
						currencyCode="VND" />
				</h3>
				<br>
				<p class="mb-4">${detail[1]}</p>
				<input name="productId" value="${detail[3]}" type="hidden">
			</c:forEach>
			<div class="d-flex mb-3">
				<p class="text-dark font-weight-medium mb-0 mr-3">Kích Cỡ:</p>
					<c:forEach var="size" items="${listSize}" varStatus="status">
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input"
								id="size-${status.index}" name="size" value="${size[1]}"> <label
								class="custom-control-label" for="size-${status.index}">${size[1]}</label>
						</div>
					</c:forEach>
			</div>
			<div class="d-flex mb-3">
				<p class="text-dark font-weight-medium mb-0 mr-3">Màu:</p>
					<c:forEach var="color" items="${listColor}" varStatus="status">
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input"
								id="color-${status.index}" name="color" value="${color[1]}"> 
								<label class="custom-control-label" for="color-${status.index}">${color[1]}</label>
						</div>
					</c:forEach>
			</div>
			<div class="d-flex">
				<p class="text-dark font-weight-medium mb-0 mr-3">Chất Liệu:</p>
				<c:choose>
					<c:when test="${not empty productById}">
						<p class="">${productById.material}</p>
					</c:when>
					<c:otherwise>
						<p class="">Product not found</p>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="d-flex">
				<p class="text-dark font-weight-medium mb-0 mr-3">Thương Hiệu:</p>
				<c:forEach var="manu" items="${listManu}">
					<p class="">${manu[1]}</p>
				</c:forEach>
			</div>
			<div class="d-flex align-items-center mb-4 pt-2">
				<div class="input-group quantity mr-3" style="width: 130px;">
					<div class="input-group-btn">
						<button type="button" class="btn btn-primary btn-minus" id="btnMinus">
							<i class="fa fa-minus"></i>
						</button>
					</div>
					<input type="text" id="qty" class="form-control bg-secondary text-center"
						value="1" name="quality">
					<div class="input-group-btn">
						<button type="button" class="btn btn-primary btn-plus" id="btnPlus">
							<i class="fa fa-plus"></i>
						</button>
					</div>
				</div>
				<button class="btn btn-primary px-3" type="submit">
					<i class="fa fa-shopping-cart mr-1"></i>
						Thêm vào giỏ
				</button>
			</div>
			<div class="d-flex pt-2">
				<p class="text-dark font-weight-medium mb-0 mr-2">Share on:</p>
				<div class="d-inline-flex">
					<a class="text-dark px-2" href=""> <i class="fab fa-facebook-f"></i>
					</a> <a class="text-dark px-2" href=""> <i class="fab fa-twitter"></i>
					</a> <a class="text-dark px-2" href=""> <i
						class="fab fa-linkedin-in"></i>
					</a> <a class="text-dark px-2" href=""> <i class="fab fa-pinterest"></i>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
</form>
<!-- Shop Detail End -->

<!-- category by id product-->
<div class="container-fluid pt-5">
	<div class="text-center mb-4">
		<h2 class="section-title px-5">
			<span class="px-2">Sản Phẩm Liên Quan</span>
		</h2>
	</div>
	<div class="row px-xl-5 pb-3">
		<c:forEach items="${relatedProducts}" var="info">
			<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
				<div class="card product-item border-0 mb-4">
					<div
						class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
						<a href="/product/detail/${info[0]}/${info[4]}"> <!-- Đảm bảo info[4] có giá trị -->
							<img class="img-fluid w-100" src="/user/img/${info[1]}" alt="">
						</a>
					</div>
					<div
						class="card-body border-left border-right text-center p-0 pt-4 pb-3">
						<h6 class="text-truncate mb-3">${info[2]}</h6>
						<div class="d-flex justify-content-center">
							<h6>
								<fmt:formatNumber value="${info[3]}" type="currency"
									currencyCode="VND" />
							</h6>
						</div>
					</div>
					<div
						class="card-footer d-flex justify-content-between bg-light border">
						<a href="/product/detail/${info[0]}/${info[4]}"
							class="btn btn-sm text-dark p-0"> <i
							class="fas fa-eye text-primary mr-1"></i>View Detail
						</a> <a href="/gio-hang" class="btn btn-sm text-dark p-0"> <i
							class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart
						</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<!--Modal  -->
   <div class="modal fade" id="customAlert" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="customAlertLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="customAlertLabel">Thông báo</h5>
                 </div>
                <div class="modal-body">
                    Vui lòng chọn kích cỡ và màu sắc trước khi thêm vào giỏ hàng.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>
<script>
	function validateForm() {
		// Get all radio buttons for size and color
		const sizes = document.getElementsByName('size');
		const colors = document.getElementsByName('color');

		// Check if any size is selected
		let sizeSelected = false;
		for (let size of sizes) {
			if (size.checked) {
				sizeSelected = true;
				break;
			}
		}

		// Check if any color is selected
		let colorSelected = false;
		for (let color of colors) {
			if (color.checked) {
				colorSelected = true;
				break;
			}
		}

		// Show custom alert if size or color is not selected
        if (!sizeSelected || !colorSelected) {
            var myModal = new bootstrap.Modal(document.getElementById('customAlert'));
            myModal.show();
            return false;
        }

		// Allow form submission if both size and color are selected
		return true;
	}

	document.getElementById('btnMinus').addEventListener('click', function() {
    var quantityInput = document.getElementById('qty');
    var currentValue = parseInt(quantityInput.value);
    if (currentValue > 1) {
        quantityInput.value = currentValue - 1;
        document.getElementById('qty').value = quantityInput.value; // Update hidden input
    }
});

document.getElementById('btnPlus').addEventListener('click', function() {
    var quantityInput = document.getElementById('qty');
    var currentValue = parseInt(quantityInput.value);
    if (currentValue<10) {
    	quantityInput.value = currentValue + 1;
        document.getElementById('qty').value = quantityInput.value; // Update hidden input
    		
	}
    });
</script>
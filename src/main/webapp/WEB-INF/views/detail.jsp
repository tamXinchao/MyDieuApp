
<!-- Shop Detail Start -->
<div class="container-fluid py-5">
	<div class="row px-xl-5">
		<div class="col-lg-5 pb-5">
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
			</c:forEach>
			<div class="d-flex mb-3">
				<p class="text-dark font-weight-medium mb-0 mr-3">Sizes:</p>
				<form>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" class="custom-control-input" id="size-1"
							name="size"> <label class="custom-control-label"
							for="size-1">XS</label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" class="custom-control-input" id="size-2"
							name="size"> <label class="custom-control-label"
							for="size-2">S</label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" class="custom-control-input" id="size-3"
							name="size"> <label class="custom-control-label"
							for="size-3">M</label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" class="custom-control-input" id="size-4"
							name="size"> <label class="custom-control-label"
							for="size-4">L</label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" class="custom-control-input" id="size-5"
							name="size"> <label class="custom-control-label"
							for="size-5">XL</label>
					</div>
				</form>
			</div>
			<div class="d-flex mb-4">
				<p class="text-dark font-weight-medium mb-0 mr-3">Colors:</p>
				<form>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" class="custom-control-input" id="color-1"
							name="color"> <label class="custom-control-label"
							for="color-1">Black</label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" class="custom-control-input" id="color-2"
							name="color"> <label class="custom-control-label"
							for="color-2">White</label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" class="custom-control-input" id="color-3"
							name="color"> <label class="custom-control-label"
							for="color-3">Red</label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" class="custom-control-input" id="color-4"
							name="color"> <label class="custom-control-label"
							for="color-4">Blue</label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" class="custom-control-input" id="color-5"
							name="color"> <label class="custom-control-label"
							for="color-5">Green</label>
					</div>
				</form>
			</div>
			<div class="d-flex align-items-center mb-4 pt-2">
				<div class="input-group quantity mr-3" style="width: 130px;">
					<div class="input-group-btn">
						<button class="btn btn-primary btn-minus">
							<i class="fa fa-minus"></i>
						</button>
					</div>
					<input type="text" class="form-control bg-secondary text-center"
						value="1">
					<div class="input-group-btn">
						<button class="btn btn-primary btn-plus">
							<i class="fa fa-plus"></i>
						</button>
					</div>
				</div>
				<button class="btn btn-primary px-3">
					<i class="fa fa-shopping-cart mr-1"></i> Add To Cart
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
<!-- Shop Detail End -->
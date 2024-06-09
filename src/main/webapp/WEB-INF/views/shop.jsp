<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
	<div
		class="d-flex flex-column align-items-center justify-content-center"
		style="min-height: 150px">
		<h1 class="font-weight-semi-bold text-uppercase mb-3">Our Shop</h1>
		<div class="d-inline-flex">
			<p class="m-0">
				<a href="/trang-chu">Home</a>
			</p>
			<p class="m-0 px-2">-</p>
			<p class="m-0">Shop</p>
		</div>
	</div>
</div>
<!-- Page Header End -->
<!-- Shop Start -->
<div class="container-fluid pt-5">
	<div class="row px-xl-5">
		<!-- Shop Sidebar Start -->
		<div class="col-lg-3 col-md-12">

			<!-- Price Start -->
			<div class="border-bottom mb-4 pb-4">
				<h5 class="font-weight-semi-bold mb-4">Sản Phẩm</h5>
				<form>
					<c:forEach var="category" items="${categories}">
						<div
							class="custom-control custom-checkbox d-flex align-items-center mb-3">
							<input type="checkbox" class="custom-control-input"
								id="category-${category.cateId}" name="category-selection"
								value="${category.cateId}"> <label
								class="custom-control-label" for="category-${category.cateId}">${category.name}</label>
						</div>
					</c:forEach>
				</form>
			</div>
			<!-- Price End -->
			<!-- Color Start -->
			<div class="border-bottom mb-4 pb-4">
				<h5 class="font-weight-semi-bold mb-4">Filter by color</h5>
				<form>
					<div
						class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
						<input type="checkbox" class="custom-control-input" checked
							id="color-all"> <label class="custom-control-label"
							for="price-all">All Color</label> <span
							class="badge border font-weight-normal">1000</span>
					</div>
					<div
						class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
						<input type="checkbox" class="custom-control-input" id="color-1">
						<label class="custom-control-label" for="color-1">Black</label> <span
							class="badge border font-weight-normal">150</span>
					</div>
					<div
						class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
						<input type="checkbox" class="custom-control-input" id="color-2">
						<label class="custom-control-label" for="color-2">White</label> <span
							class="badge border font-weight-normal">295</span>
					</div>
					<div
						class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
						<input type="checkbox" class="custom-control-input" id="color-3">
						<label class="custom-control-label" for="color-3">Red</label> <span
							class="badge border font-weight-normal">246</span>
					</div>
					<div
						class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
						<input type="checkbox" class="custom-control-input" id="color-4">
						<label class="custom-control-label" for="color-4">Blue</label> <span
							class="badge border font-weight-normal">145</span>
					</div>
					<div
						class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
						<input type="checkbox" class="custom-control-input" id="color-5">
						<label class="custom-control-label" for="color-5">Green</label> <span
							class="badge border font-weight-normal">168</span>
					</div>
				</form>
			</div>
			<!-- Color End -->

			<!-- Size Start -->
			<div class="mb-5">
				<h5 class="font-weight-semi-bold mb-4">Filter by size</h5>
				<form>
					<div
						class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
						<input type="checkbox" class="custom-control-input" checked
							id="size-all"> <label class="custom-control-label"
							for="size-all">All Size</label> <span
							class="badge border font-weight-normal">1000</span>
					</div>
					<div
						class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
						<input type="checkbox" class="custom-control-input" id="size-1">
						<label class="custom-control-label" for="size-1">XS</label> <span
							class="badge border font-weight-normal">150</span>
					</div>
					<div
						class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
						<input type="checkbox" class="custom-control-input" id="size-2">
						<label class="custom-control-label" for="size-2">S</label> <span
							class="badge border font-weight-normal">295</span>
					</div>
					<div
						class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
						<input type="checkbox" class="custom-control-input" id="size-3">
						<label class="custom-control-label" for="size-3">M</label> <span
							class="badge border font-weight-normal">246</span>
					</div>
					<div
						class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
						<input type="checkbox" class="custom-control-input" id="size-4">
						<label class="custom-control-label" for="size-4">L</label> <span
							class="badge border font-weight-normal">145</span>
					</div>
					<div
						class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
						<input type="checkbox" class="custom-control-input" id="size-5">
						<label class="custom-control-label" for="size-5">XL</label> <span
							class="badge border font-weight-normal">168</span>
					</div>
				</form>
			</div>
			<!-- Size End -->
		</div>
		<!-- Shop Sidebar End -->


		<!-- Shop Product Start -->
		<div class="col-lg-9 col-md-12">
			<div class="row pb-3">
				<div class="col-12 pb-1">
					<div class="d-flex align-items-center justify-content-between mb-4">
						<form action="/shop/product/search" method="post">
							<div class="input-group">
								<input type="text" name="keywords" value="${keywords}"
									class="form-control" placeholder="Search by name">
								<div class="input-group-append">
									<button class="input-group-text bg-transparent text-primary">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</div>
						</form>
						<div class="dropdown ml-4">
							<button class="btn border dropdown-toggle" type="button"
								id="triggerId" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">Sort by</button>
							<div class="dropdown-menu dropdown-menu-right"
								aria-labelledby="triggerId">
								<a class="dropdown-item" href="#">Latest</a> <a
									class="dropdown-item" href="#">Popularity</a> <a
									class="dropdown-item" href="#">Best Rating</a>
							</div>
						</div>
					</div>
				</div>

				<div id="product-list" class="col-lg-12 col-md-12 col-sm-12 row">
					<jsp:include page="${display}"></jsp:include>
				</div>


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
								aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
									class="sr-only">Next</span>
							</a>
							</li>
						</ul>
					</nav>

				</div>
			</div>
		</div>
		<!-- Shop Product End -->
	</div>
</div>
<!-- Shop End -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$('input[name="category-selection"]').change(filterProducts);
	});

	function filterProducts() {
		var selectedCategories = [];
		$('input[name="category-selection"]:checked').each(function() {
			selectedCategories.push($(this).val());
		});

		$.ajax({
			type : 'POST',
			contentType : 'application/json',
			url : '${pageContext.request.contextPath}/filterProducts',
			data : JSON.stringify(selectedCategories),
			success : function(data) {
				console.log(data); // Log the response data
				$('#product-list').html(data);
			},
			error : function(xhr, status, error) {
				console.error("Error occurred: " + status + " " + error);
			}
		});
	}
</script>

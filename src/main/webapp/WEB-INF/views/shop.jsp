<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
	<div
		class="d-flex flex-column align-items-center justify-content-center"
		style="min-height: 150px">
		<h1 class="font-weight-semi-bold text-uppercase mb-3">Cửa hàng</h1>
		<div class="d-inline-flex">
			<p class="m-0">
				<a href="/trang-chu">Trang chủ</a>
			</p>
			<p class="m-0 px-2">-</p>
			<p class="m-0">Cửa hàng</p>
		</div>
	</div>
</div>
<!-- Page Header End -->
<!-- Shop Start -->
<div class="container-fluid pt-5">
	<div class="row px-xl-5">
		<!-- Shop Sidebar Start -->
		<div class="col-lg-3 col-md-12">

			<form id="filter-form">
				<!-- Danh mục -->
				<div class="border-bottom mb-4 pb-4">
					<h5 class="font-weight-semi-bold mb-4">Sản Phẩm</h5>
					<c:forEach var="category" items="${categories}">
						<div
							class="custom-control custom-checkbox d-flex align-items-center mb-3">
							<input type="checkbox" class="custom-control-input"
								id="category-${category.cateId}" name="category-selection"
								value="${category.cateId}"> <label
								class="custom-control-label" for="category-${category.cateId}">${category.name}</label>
						</div>
					</c:forEach>
				</div>

				<!-- Màu sắc -->
				<div class="border-bottom mb-4 pb-4">
					<h5 class="font-weight-semi-bold mb-4">Lọc theo màu sắc</h5>
					<c:forEach var="color" items="${colors}">
						<div
							class="custom-control custom-checkbox d-flex align-items-center mb-3">
							<input type="checkbox" class="custom-control-input"
								id="color-${color.colorId}" name="color-selection"
								value="${color.colorId}"> <label
								class="custom-control-label" for="color-${color.colorId}">${color.name}</label>
						</div>
					</c:forEach>
				</div>

				<!-- Kích thước -->
				<div class="border-bottom mb-4 pb-4">
					<h5 class="font-weight-semi-bold mb-4">Lọc theo kích thước</h5>
					<c:forEach var="size" items="${sizes}">
						<div
							class="custom-control custom-checkbox d-flex align-items-center mb-3">
							<input type="checkbox" class="custom-control-input"
								id="size-${size.sizeId}" name="size-selection"
								value="${size.sizeId}"> <label
								class="custom-control-label" for="size-${size.sizeId}">${size.name}</label>
						</div>
					</c:forEach>
				</div>
			</form>

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
								<a class="dropdown-item" href="/shop/sort?order=asc">Giá:
									Low to High</a> <a class="dropdown-item"
									href="/shop/sort?order=desc">Giá: Từ cao đến thấp</a>
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
									<span class="sr-only">Trước</span>
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
									class="sr-only">Sau</span>
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
    // Thêm sự kiện change cho các checkbox lọc
    $('input[name="category-selection"], input[name="color-selection"], input[name="size-selection"]').change(function() {
        // Gọi hàm filterProducts để xử lý lọc sản phẩm và cập nhật URL
        filterProducts();
        updateURLWithFilters();
        
    });

    // Đọc tham số URL và cập nhật các checkbox tương ứng
    var urlParams = new URLSearchParams(window.location.search);

    var categories = urlParams.get('categories') ? urlParams.get('categories').split(',') : [];
    categories.forEach(function(category) {
        $('#category-' + category).prop('checked', true);
    });

    var colors = urlParams.get('colors') ? urlParams.get('colors').split(',') : [];
    colors.forEach(function(color) {
        $('#color-' + color).prop('checked', true);
    });

    var sizes = urlParams.get('sizes') ? urlParams.get('sizes').split(',') : [];
    sizes.forEach(function(size) {
        $('#size-' + size).prop('checked', true);
    });

});

function filterProducts() {
    var selectedCategories = [];
    $('input[name="category-selection"]:checked').each(function() {
        selectedCategories.push($(this).val());
    });

    var selectedColors = [];
    $('input[name="color-selection"]:checked').each(function() {
        selectedColors.push($(this).val());
    });

    var selectedSizes = [];
    $('input[name="size-selection"]:checked').each(function() {
        selectedSizes.push($(this).val());
    });

    var filters = {
        categories : selectedCategories,
        colors : selectedColors,
        sizes : selectedSizes
    };

    // Gửi yêu cầu AJAX để lọc sản phẩm và cập nhật nội dung trang
    $.ajax({
        type : 'POST',
        contentType : 'application/json',
        url : '/filterProducts',
        data : JSON.stringify(filters),
        success : function(data) {
            $('#product-list').html(data);
        },
        error : function(xhr, status, error) {
            console.error("Đã xảy ra lỗi: " + status + " " + error);
        }
    });
}

function updateURLWithFilters() {
    var selectedCategories = [];
    $('input[name="category-selection"]:checked').each(function() {
        selectedCategories.push($(this).val());
    });

    var selectedColors = [];
    $('input[name="color-selection"]:checked').each(function() {
        selectedColors.push($(this).val());
    });

    var selectedSizes = [];
    $('input[name="size-selection"]:checked').each(function() {
        selectedSizes.push($(this).val());
    });

    var url = new URL(window.location.href);

    // Chỉ thêm các tham số vào URL nếu có checkbox đang được chọn
    if(selectedCategories.length > 0) {
        url.searchParams.set('categories', selectedCategories.join(','));
    } else {
        url.searchParams.delete('categories');
    }

    if(selectedColors.length > 0) {
        url.searchParams.set('colors', selectedColors.join(','));
    } else {
        url.searchParams.delete('colors');
    }

    if(selectedSizes.length > 0) {
        url.searchParams.set('sizes', selectedSizes.join(','));
    } else {
        url.searchParams.delete('sizes');
    }
   
    history.pushState(null, '', url);
   
}

</script>




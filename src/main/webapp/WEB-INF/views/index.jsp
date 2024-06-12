
<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="head.jsp"></jsp:include>
<title>Home</title>
</head>
<body>
	<!-- Topbar Start -->
	<div class="container-fluid">
		<div class="row align-items-center py-3 px-xl-5">
			<div class="col-lg-3 d-none d-lg-block">
				<a href="/trang-chu" class="text-decoration-none">
					<h1 class="m-0 display-5 font-weight-semi-bold">
						<span class="text-primary font-weight-bold border px-3 mr-1">M</span>Mỹ
						Diệu
					</h1>
				</a>
			</div>
			<div class="col-lg-6 col-6 text-left">
				<form action="">
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="Search for products">
						<div class="input-group-append">
							<span class="input-group-text bg-transparent text-primary">
								<i class="fa fa-search"></i>
							</span>
						</div>
					</div>
				</form>
			</div>
			<div class="col-lg-3 col-6 text-right">
				<a href="" class="btn border"> <i
					class="fas fa-heart text-primary"></i> <span class="badge">0</span>
				</a> <a href="/gio-hang" class="btn border"> <i
					class="fas fa-shopping-cart text-primary"></i> <span class="badge">${Count}</span>
				</a>
			</div>
		</div>
	</div>
	<!-- Topbar End -->

	<!-- Navbar Start -->
	<div class="container-fluid mb-5">
		<div class="row border-top px-xl-5">
			<div class="col-lg-12">
				<nav
					class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
					<a href="" class="text-decoration-none d-block d-lg-none">
						<h1 class="m-0 display-5 font-weight-semi-bold">
							<span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper
						</h1>
					</a>
					<button type="button" class="navbar-toggler" data-toggle="collapse"
						data-target="#navbarCollapse">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-between"
						id="navbarCollapse">
						<c:choose>
							<c:when test="${sessionScope.roleSession eq 2 }">
								<div class="navbar-nav mr-auto py-0">
									<!-- Hiển thị khi cho người dùng đã đăng nhập thành công với tài khoản admin -->
									<a href="" class="nav-item nav-link active">Trang chủ</a>
									<a href="" class="nav-item nav-link">Cửa hàng</a> <a
										href="#" class="nav-item nav-link">Liên hệ</a>
									<div class="nav-item dropdown">
										<a href="/shop/danh-sach-san-pham" class="nav-link dropdown-toggle"
											data-toggle="dropdown">Thêm</a>
										<div class="dropdown-menu rounded-0 m-0">
											<a href="/admin/trang-chu" class="dropdown-item">Trang quản trị</a>
										</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="navbar-nav mr-auto py-0">
									<a href="/trang-chu" class="nav-item nav-link active">Trang chủ</a>
									<a href="/shop/danh-sach-san-pham" class="nav-item nav-link">Cửa hàng</a> <a
										href="#" class="nav-item nav-link">Liên hệ</a>
								</div>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${not empty sessionScope.userSession}">
								<!-- Hiển thị khi cho người dùng đã đăng nhập thành công -->
								<div class="navbar-nav ml-auto py-0">
									<a href="/information" class="nav-item nav-link">${sessionScope.userSession.fullname}</a>
									<a href="/logout" class="nav-item nav-link">Đăng xuất</a>
								</div>
							</c:when>
							<c:otherwise>
								<!-- Hiển thị khi người dùng chưa đăng nhập -->
								<div class="navbar-nav ml-auto py-0">
									<a href="/login" class="nav-item nav-link">Đăng nhập</a> <a
										href="/register" class="nav-item nav-link">Đăng ký</a>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</nav>
				<div id="header-carousel" class="carousel slide"
					data-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active" style="height: 410px;">
							<img class="img-fluid" src="/template/img/carousel-1.jpg"
								alt="Image">
							<div
								class="carousel-caption d-flex flex-column align-items-center justify-content-center">
								<div class="p-3" style="max-width: 700px;">
									<h4 class="text-light text-uppercase font-weight-medium mb-3">10%
										Off Your First Order</h4>
									<h3 class="display-4 text-white font-weight-semi-bold mb-4">Fashionable
										Dress</h3>
									<a href="" class="btn btn-light py-2 px-3">Shop Now</a>
								</div>
							</div>
						</div>
						<div class="carousel-item" style="height: 410px;">
							<img class="img-fluid" src="/template/img/carousel-2.jpg"
								alt="Image">
							<div
								class="carousel-caption d-flex flex-column align-items-center justify-content-center">
								<div class="p-3" style="max-width: 700px;">
									<h4 class="text-light text-uppercase font-weight-medium mb-3">10%
										Off Your First Order</h4>
									<h3 class="display-4 text-white font-weight-semi-bold mb-4">Reasonable
										Price</h3>
									<a href="" class="btn btn-light py-2 px-3">Shop Now</a>
								</div>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#header-carousel"
						data-slide="prev">
						<div class="btn btn-dark" style="width: 45px; height: 45px;">
							<span class="carousel-control-prev-icon mb-n2"></span>
						</div>
					</a> <a class="carousel-control-next" href="#header-carousel"
						data-slide="next">
						<div class="btn btn-dark" style="width: 45px; height: 45px;">
							<span class="carousel-control-next-icon mb-n2"></span>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Navbar End -->


	<!-- faetured start-->
	<div class="container-fluid pt-5">
		<div class="row px-xl-5 pb-3">
			<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
				<div class="d-flex align-items-center border mb-4"
					style="padding: 30px;">
					<h1 class="fa fa-check text-primary m-0 mr-3"></h1>
					<h5 class="font-weight-semi-bold m-0">Sản phẩm chất lượng</h5>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
				<div class="d-flex align-items-center border mb-4"
					style="padding: 30px;">
					<h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
					<h5 class="font-weight-semi-bold m-0">Miễn phí giao hàng</h5>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
				<div class="d-flex align-items-center border mb-4"
					style="padding: 30px;">
					<h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
					<h5 class="font-weight-semi-bold m-0">Hoàn trả trong vòng - 14 ngày</h5>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
				<div class="d-flex align-items-center border mb-4"
					style="padding: 30px;">
					<h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
					<h5 class="font-weight-semi-bold m-0">Hỗ trợ 24/7</h5>
				</div>
			</div>
		</div>
	</div>
	<!-- faetured end-->

	<!-- categories start -->
	<div class="container-fluid pt-5">
		<div class="text-center mb-4">
			<h2 class="section-title px-5">
				<span class="px-2"> Loại giày </span>
			</h2>
		</div>
		<div class="row px-xl-5 pb-3">
			<c:forEach var="caterogyList" items="${countProductOfCate}"
				varStatus="status">
				<c:choose>
					<c:when test="${status.index < 4}">
						<div class="col-lg-3 col-md-6 pb-1">
							<div class="cat-item d-flex flex-column border mb-4"
								style="padding: 30px;">
								<p class="text-right">Số lượng: ${caterogyList.countProduct}</p>
								<a href="/shop/category/${caterogyList.idCate}"
									class="cat-img position-relative overflow-hidden mb-3"> <img
									class="img-fluid" src="/user/img/${caterogyList.image}" alt="">
								</a>
								<h5 class="font-weight-semi-bold m-0">${caterogyList.nameCate}</h5>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="col-lg-3 col-md-6 pb-1 extra-item"
							style="display: none;">
							<div class="cat-item d-flex flex-column border mb-4"
								style="padding: 30px;">
								<p class="text-right">Số lượng: ${caterogyList.countProduct}</p>
								<a href="/shop/category/${caterogyList.idCate}"
									class="cat-img position-relative overflow-hidden mb-3"> <img
									class="img-fluid" src="/user/img/${caterogyList.image}" alt="">
								</a>
								<h5 class="font-weight-semi-bold m-0">${caterogyList.nameCate}</h5>
							</div>
						</div>
					</c:otherwise>
				</c:choose>

			</c:forEach>
			<div class="col-12 pb-1">
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center mb-3">
						<li class="page-item active"><a class="page-link" href="#"
							id="toggle-items">Xem thêm</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<!-- categories end -->

	<!-- JavaScript -->
	<script>
		document.getElementById('toggle-items').addEventListener('click',
				function(event) {
					event.preventDefault();
					var hiddenItems = document.querySelectorAll('.extra-item');
					var isHidden = hiddenItems[0].style.display === 'none';

					hiddenItems.forEach(function(item) {
						item.style.display = isHidden ? 'block' : 'none';
					});

					this.textContent = isHidden ? 'Ẩn' : 'Xem thêm';
				});
	</script>

	<!-- offer start-->

	<div class="container-fluid offer pt-5">
		<div class="row px-xl-5">
			<div class="col-md-6 pb-4">
				<div
					class="position-relative bg-secondary text-center text-md-right text-white mb-2 py-5 px-5">
					<img src="/template/img/offer-1.png" alt="">
					<div class="position-relative" style="z-index: 1;">
						<h5 class="text-uppercase text-primary mb-3">Giảm giá tận 20%</h5>
						<h1 class="mb-4 font-weight-semi-bold">Bộ sưu tập mùa xuân</h1>
						<a href="" class="btn btn-outline-primary py-md-2 px-md-3">Mua ngay</a>
					</div>
				</div>
			</div>
			<div class="col-md-6 pb-4">
				<div
					class="position-relative bg-secondary text-center text-md-left text-white mb-2 py-5 px-5">
					<img src="img/offer-2.png" alt="">
					<div class="position-relative" style="z-index: 1;">
						<h5 class="text-uppercase text-primary mb-3">Giảm giá tận 20%</h5>
						<h1 class="mb-4 font-weight-semi-bold">Bộ sưu tập mùa thu</h1>
						<a href="" class="btn btn-outline-primary py-md-2 px-md-3">Mua ngay</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- offer end-->

	<!-- product start -->

	<div class="container-fluid pt-5">
		<div class="text-center mb-4">
			<h2 class="section-title px-5">
				<span class="px-2">Sản phẩm</span>
			</h2>
		</div>
		<div class="row px-xl-5 pb-3">
			<c:forEach items="${top10Product}" var="info">
				<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
					<div class="card product-item border-0 mb-4">
						<div
							class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">

							<a href="/product/detail/${info[3]}/${info[4]}"><img
								class="img-fluid w-100" src="/user/img/${info[0]}" alt=""></a>

						</div>
						<div
							class="card-body border-left border-right text-center p-0 pt-4 pb-3">
							<h6 class="text-truncate mb-3">${info[1]}</h6>
							<div class="d-flex justify-content-center">
								<h6>
									<fmt:formatNumber value="${info[2]}" type="currency"
										currencyCode="VND" />
								</h6>
							</div>
						</div>
						<div
							class="card-footer d-flex justify-content-between bg-light border">
							<a href="/product/detail/${info[3]}/${info[4]}"
								class="btn btn-sm text-dark p-0"><i
								class="fas fa-eye text-primary mr-1"></i>Chi tiết</a> <a
								href="/gio-hang" class="btn btn-sm text-dark p-0"><i
								class="fas fa-shopping-cart text-primary mr-1"></i>Thêm giỏ hàng</a>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
	</div>
	<!-- product end -->
	<div class="d-flex justify-content-center align-items-center">
		<button class="btn btn-primary px-3">
			<a href="/shop/danh-sach-san-pham">Xem Thêm</a>
		</button>
	</div>

	<!-- vendor start -->

	<div class="container-fluid py-5">
		<div class="row px-xl-5">
			<div class="col">
				<div class="owl-carousel vendor-carousel">
					<div class="vendor-item border p-4">
						<img src="/template/img/vendor-1.jpg" alt="">
					</div>
					<div class="vendor-item border p-4">
						<img src="/template/img/vendor-2.jpg" alt="">
					</div>
					<div class="vendor-item border p-4">
						<img src="/template/img/vendor-3.jpg" alt="">
					</div>
					<div class="vendor-item border p-4">
						<img src="/template/img/vendor-4.jpg" alt="">
					</div>
					<div class="vendor-item border p-4">
						<img src="/template/img/vendor-5.jpg" alt="">
					</div>
					<div class="vendor-item border p-4">
						<img src="/template/img/vendor-6.jpg" alt="">
					</div>
					<div class="vendor-item border p-4">
						<img src="/template/img/vendor-7.jpg" alt="">
					</div>
					<div class="vendor-item border p-4">
						<img src="/template/img/vendor-8.jpg" alt="">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- vendor end -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>


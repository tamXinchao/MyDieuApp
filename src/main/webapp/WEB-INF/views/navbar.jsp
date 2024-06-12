

<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<!-- Topbar Start -->
<div class="container-fluid">
	<div class="row align-items-center py-3 px-xl-5">
		<div class="col-lg-3 d-none d-lg-block">
			<a href="/trang-chu" class="text-decoration-none">
				<h1 class="m-0 display-5 font-weight-semi-bold">
					<span class="text-primary font-weight-bold border px-3 mr-1">M</span>Mỹ Diệu
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
<div class="container-fluid">
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
								<a href="/trang-chu" class="nav-item nav-link active">Trang chủ</a> <a
									href="/shop/danh-sach-san-pham" class="nav-item nav-link">Cửa hàng</a> <a
									href="#" class="nav-item nav-link">Liên hệ</a>
								<div class="nav-item dropdown">
									<a href="#" class="nav-link dropdown-toggle"
										data-toggle="dropdown">Thêm</a>
									<div class="dropdown-menu rounded-0 m-0">
										<a href="/admin/trang-chu" class="dropdown-item">Trang quản lý</a>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="navbar-nav mr-auto py-0">
								<a href="/trang-chu" class="nav-item nav-link active">Trang chủ</a> <a
									href="/shop/danh-sach-san-pham" class="nav-item nav-link">Cửa hàng</a> <a
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
		</div>
	</div>
</div>
<!-- Navbar End -->